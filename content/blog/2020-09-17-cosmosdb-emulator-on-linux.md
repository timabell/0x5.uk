---
title: Running the CosmosDB emulator on Linux
layout: post
---

Update: microsoft have released a linux compatible docker image it seems, let me know if it actually works and I'll update this post. <https://docs.microsoft.com/en-us/azure/cosmos-db/linux-emulator>

----

Unfortunately even though "Microsoft 🖤 Linux" the CosmosDB team seem less keen. This is not fun, pretty or stable, but at least it works which is something.

There is a docker image but it only runs on docker-for-windows so it's no help here.

## Overview

1. Grab a Windows VM, install the emulator.
2. Copy the emulator SSL cert to the host.
3. Map the ports.
4. Redirect the VM IP back to localhost with iptables.

## Steps

### Get a Windows VirtualBox VM Running

Download the VirtualBox image from <https://developer.microsoft.com/en-us/windows/downloads/virtual-machines/> (2 month free trial, no key needed).

Install VirtualBox.
 
Fix the VM image configuration (if you are using the slightly older VirtualBox from ubuntu's apt repositories) by removing `controller="VBoxSVGA"` from the `.ovf` file in the `.ova` file (which is a tar.gz archive). See <https://schnouki.net/post/2020/how-to-run-a-win10-dev-vm-on-virtualbox-5/> for details.

Import the VM into VirtualBox

Run the VM

Install the guest additions (Devices > Insert guest additions CD)

Set the timezone (VM defaults to US).

Turn on seamless copy-paste & drag-and-drop (so that we can move certificate and data files to/from the host easily).

### Set up the CosmosDB emulator

In the Windows VM download and install the CosmosDB emulator in the VM from <https://docs.microsoft.com/en-us/azure/cosmos-db/local-emulator?tabs=ssl-netstd21#installation>

If the emulator is already running, shut it down:

```powershell
cd "C:\Program Files\Azure Cosmos DB Emulator"
.\Microsoft.Azure.Cosmos.Emulator.exe /shutdown
```

Start the emulator with network access enabled.

```powershell
cd "C:\Program Files\Azure Cosmos DB Emulator"
.\Microsoft.Azure.Cosmos.Emulator.exe /AllowNetworkAccess /DisableRateLimiting /Key='C2y6yDjf5/R+ob0N8A7Cgv30VRDJIWEHLM+4QDU5DE2nQ9nDuVTqobD4b8mGGyPMbIZnqyMsEcaGQy67XIw/Jw=='
```

(This key is the hard-coded well-known key that the emulator uses by default, which makes it easy to connect the storage explorer).

Check it is listening on `0.0.0.0:8081` (as opposed to `127.0.0.1:8081`):

```
netstat -a |findstr 8081
```

### Map the CosmosDB port to the host

In the VirtualBox network settings for the VM, click advanced and add a port mapping for 8081 on the VM to 8081 on the host.

See <https://www.howtogeek.com/122641/how-to-forward-ports-to-a-virtual-machine-and-use-it-as-a-server/>

This makes the emulator appear as if it was running on the Linux host.

(Note there are replica ports that need mapping too, see the dotnet-core section below).


### Connect with Storage Explorer

Install the Azure Storage Explorer on your Linux host, either with the .tar.gz or from the snap store

<https://azure.microsoft.com/en-us/features/storage-explorer/>

Run the storage explorer.

Connect to the emulator on localhost.

You should now be able to create collections and add documents, and then view them.

### Connecting from dotnet-core

Problems connecting from core that I didn't encounter with storage explorer:

1. The SSL certificate is rejected.
2. CosmosDB sets the [`ReadEndpoint`](https://docs.microsoft.com/en-us/dotnet/api/microsoft.azure.documents.client.documentclient.readendpoint) to be the VM's IP address, which isn't accessible from the host because we are using NAT and port mapping. (oddly this wasn't consistently the interal IP address.
3. The replicas listen on additional ports which also need mapping.

#### Accepting the emulator SSL certificate

This is the error you get trying to connect to the CosmosDB emulator from dotnet core on Linux without adding the certificate to the Linux host's certificate authority (CA) list:
```
System.Net.Http.HttpRequestException:
The SSL connection could not be established,
see inner exception. ---> System.Security.Authentication.AuthenticationException:
The remote certificate is invalid according to the validation procedure.
  at at System.Net.Security.SslStream.StartSendAuthResetSignal(
	ProtocolToken message, AsyncProtocolRequest asyncRequest, ExceptionDispatchInfo exception)
```

Export the emulator's public SSL certificate "DocumentDbEmulatorCertificate" as base64 X509.

Reference: <https://docs.microsoft.com/en-us/azure/cosmos-db/local-emulator-export-ssl-certificates#how-to-export-the-azure-cosmos-db-tlsssl-certificate>

Copy the exported file to your Linux host.

Add the certificate to the trusted certificates on your machine (these instructions are for Ubuntu/Mint):

```
sudo cp --verbose cosmos-emulator.cer /usr/local/share/ca-certificates/cosmos-emulator.crt
sudo update-ca-certificates --verbose
```

Reference: <https://stackoverflow.com/questions/44159793/trusted-root-certificates-in-dotnet-core-on-linux-rhel-7-1/44160125#44160125>

Note the change in file extension from `.cer` to `.crt` between export and import (I'm not 100% sure if this matters).

*Note that the certificate is regenerated on emulator startup* so you'll either have to do this every time or pass the emulator a predefined certificate to use.

If you want to validate the certificate has been installed, see <https://unix.stackexchange.com/questions/97244/list-all-available-ssl-ca-certificates>

#### Redirecting ReadEndpoint traffic

In the VM in a powershell or command prompt run `ipconfig` to get the machine's IP address.

Tell `iptables` to redirect all requests for the VM's IP address back to `localhost`:

```bash
sudo iptables -t nat -I OUTPUT --dst 10.0.2.XXX -p tcp --dport 8081 -j REDIRECT --to-ports 8081
```

Where `XXX` is the IP of your VM.

As per: <https://unix.stackexchange.com/questions/441182/how-to-map-an-ip-address-to-localhost>

#### Mapping replica port(s)

On the VM run `netstat -a |findstr LISTENING`

You'll see a bunch of ports in the 10,000-20,000 range. These are the replicas

I found out which ports to map by running the client code and looking at the exception when it failed to connect. It was only port `10253` for me so far. Here's the error for a failure:

```
Microsoft.Azure.Documents.ServiceUnavailableException: Service is currently unavailable.
ActivityId: 2dfaf5dc-0d5a-4ed7-828d-c16cdcd117a3, 
RequestStartTime: 2020-09-17T20:00:16.8868999Z, RequestEndTime: 2020-09-17T20:00:46.7777188Z, Number of regions attempted: 1
ResponseTime: 2020-09-17T20:00:16.9400284Z, StoreResult: StorePhysicalAddress: rntbd://10.0.2.15:10253/apps/DocDbApp/services/DocDbServer15/partitions/a4cb495b-38c8-11e6-8106-8cdcd42c33be/replicas/1p/, LSN: -1, GlobalCommittedLsn: -1, PartitionKeyRangeId: , IsValid: False, StatusCode: 410, SubStatusCode: 0, RequestCharge: 0, ItemLSN: -1, SessionToken: , UsingLocalLSN: True, TransportException: A client transport error occurred: Failed to connect to the remote endpoint. (Time: 2020-09-17T20:00:16.9221735Z, activity ID: 2dfaf5dc-0d5a-4ed7-828d-c16cdcd117a3, error code: ConnectFailed [0x0005], base error: socket error ConnectionRefused [0x0000274D], URI: rntbd://10.0.2.15:10253/, connection: <not connected> -> rntbd://10.0.2.15:10253/, payload sent: False, CPU history: not available, CPU count: 8), ResourceType: Document, OperationType: Query
```

Add these ports to the VirtualBox port mapping configuration for your VM.

In the VM in a powershell or command prompt run `ipconfig` to get the machine's IP address.

Tell `iptables` to redirect all requests for the VM's IP address back to `localhost`:

```bash
sudo iptables -t nat -I OUTPUT --dst 10.0.2.XXX -p tcp --dport 10253 -j REDIRECT --to-ports 10253
```

Where `XXX` is the IP of your VM and `10253` is the replica port.

As per: <https://unix.stackexchange.com/questions/441182/how-to-map-an-ip-address-to-localhost>

## Importing data

If you need to import data then use data migration tool from <https://docs.microsoft.com/en-us/azure/cosmos-db/import-data#Install>

## Success

With all of the above I was then able to connect a dotnet-core application on Linux to a CosmosDB emulator.

## Emulator failures

After a while and some unrecorded fiddling, the emulator then gave up the ghost, resulting in the Azure Storage Explorer reporting the apparently meaningless error message "Unable to retrieve child resources."

According to the internet this error could mean anything. <https://social.technet.microsoft.com/wiki/contents/articles/53393.azure-storage-explorer-troubleshooting-unable-to-retrieve-child-resources-or-the-request-action-could-not-be-completed.aspx>

I might just blow the whole VM away and start again...

## Should you use CosmosDB?

CosmosDB comes with significantly increased costs:

* I gather it's very expensive to run in production
* Development is painful

As a result you should only choose CosmosDB for your solution if you *really* need something it offers that you can't get from a more straight-forward SQL or DocumentDB solution and your domain is a good match for the document-database (aka NoSQL) model.

## Further reading

* [Azure Development using CosmosDB offline Emulator by Matt Thankachan](https://medium.com/faun/comosdb-offline-emulator-78559ae91cd1)
