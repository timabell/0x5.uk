---
path: /2025/10/25/using-gitopolis-to-manage-multiple-git-repositories/
title: "Using Gitopolis to Manage Multiple Git Repositories"
---

At some point, every microservices project turns into a small city of Git repos.  
You start with three or four, and before long you’ve got twenty.

[Gitopolis](https://github.com/rustworkshop/gitopolis) makes that manageable.

```
auth/
billing/
users/
orders/
payments/
inventory/
notifications/
web-ui/
admin-ui/
mobile/
infra/
ci/
monitoring/
alerts/
gateway/
docs/
devtools/
scripts/
design-system/
shared/
```

Alice is a backend developer, but she needs to keep an eye on frontend and infra changes too.  
All of it matters. All of it lives in Git.

* * *

## Day One: Setup

She installs Gitopolis and points it at her working directory:

```bash
cd ~/work
gitopolis add *
```

Fifteen existing repos are added instantly.  
Gitopolis writes a `.gitopolis.toml` file listing their paths, remotes, and metadata.  
It’s plain text — no magic, no database.

Then she tags them by team:

```bash
gitopolis tag backend auth billing users orders payments inventory notifications gateway
gitopolis tag frontend web-ui admin-ui mobile design-system
gitopolis tag infra infra ci monitoring alerts
gitopolis tag shared shared devtools scripts docs
```

Now she can focus on only what matters that day.

* * *

## Day Two: Payoff

Instead of jumping between folders, she runs everything from the top level.

Pull all backend repos:

```bash
gitopolis exec -t backend -- git pull
```

Check their current status:

```bash
gitopolis exec -t backend -- git status
```

See what’s changed in the last week:

```bash
gitopolis exec -t backend -- git log -n 5 --since="One Week"
```

She creates a few shell aliases:

```bash
alias gpl='gitopolis exec -t backend -- git pull'
alias gst='gitopolis exec -t backend -- git status'
alias gls='gitopolis exec -t backend -- git log -n 5 --since="One Week"'
```

Now she runs `gpl` with her morning coffee, `gst` before lunch, `gls` before stand-up.  
Her workflow stops feeling scattered.

* * *

## Day Three: A New Starter

The company’s onboarding process mentions “Install Gitopolis”.  
Alice drops a copy of `.gitopolis.toml` into the shared Google Drive folder and links it in the new-starter docs.

When Dana joins the team, she runs:

```bash
mkdir ~/work && cd ~/work
cp ~/GoogleDrive/dev-setup/.gitopolis.toml .
gitopolis clone
```

All the right repos appear in the right places.

Alice shows her how to explore the setup:

```bash
$ gitopolis tags --long

backend
        auth
        billing
        users
        orders
        payments
        inventory
        notifications
        gateway
        shipping

frontend
        web-ui
        admin-ui
        mobile
        design-system
        returns

infra
        infra
        ci
        monitoring
        alerts

shared
        shared
        devtools
        scripts
        docs

```

Dana can instantly see which repos belong to which teams — `backend`, `frontend`, `infra`, `shared`.  
She starts working without having to ask where anything lives.

* * *

## Day Four: Evolving

As the project grows, Alice adds and syncs new repos as needed.

Adding a local repo she’s just created:

```bash
gitopolis add shipping
gitopolis tag backend shipping
```

Cloning a new remote one that Chloe (frontend) just pushed:

```bash
gitopolis clone git@github.com:org/returns.git
gitopolis tag frontend returns
```

When remotes move or change names:

```bash
gitopolis sync --read-remotes
```

The `.gitopolis.toml` stays current. Everyone stays in sync.

* * *

* **Immediate payoff for one developer** before anyone else uses it.
* **Tag-scoped focus** to limit noise across teams.
* **Simple onboarding** with a shared config file.
* **No daemons, no central service — just text and Git.**

* * *

Hope that helps you see how Gitopolis can be useful in a real project.  
I’ve done everything above with names changed to avoid mentioning clients and details simplified for the sake of explanation.

Let me know how you get on with it or if you have any problems.

More info: [github.com/rustworkshop/gitopolis](https://github.com/rustworkshop/gitopolis)
