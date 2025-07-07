---
layout: post
title: format all documents in a visual studio solution
date: '2009-01-29T11:49:00.011Z'
author: Tim Abell
tags:
- macro
- vb
- visual studio
modified_time: '2009-06-25T11:59:34.737Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-8623933611307349730
blogger_orig_url: https://timwise.blogspot.com/2009/01/format-all-document-in-visual-studio.html
---

Here's a handy macro script for visual studio I knocked together today.  It
runs "edit, format document" on every document of the listed file types.

You have to keep an eye on it as it's interactive and does sometimes pop up a
message and wait for an answer.

You can get the vb file at
[http://github.com/timabell/vs-formatter-macro](http://github.com/timabell/vs-formatter-macro)
More info at
[http://wiki.github.com/timabell/vs-formatter-macro](http://wiki.github.com/timabell/vs-formatter-macro)

Below is the original code. Note that this is older than the version available
on github above.

```
Imports System
Imports EnvDTE
Imports EnvDTE80
Imports EnvDTE90
Imports System.Collections.Generic
Imports System.Diagnostics
Imports System.Text

Public Module Formatting

 Dim allowed As List(Of String) = New List(Of String)
 Dim processed As Integer = 0
 Dim ignored As Integer = 0
 Dim errors As StringBuilder = New StringBuilder()
 Dim skippedExtensions As List(Of String) = New List(Of String)

 Public Sub FormatProject()
  allowed.Add(".master")
  allowed.Add(".aspx")
  allowed.Add(".ascx")
  allowed.Add(".asmx")
  allowed.Add(".cs")
  allowed.Add(".vb")
  allowed.Add(".config")
  allowed.Add(".css")
  allowed.Add(".htm")
  allowed.Add(".html")
  allowed.Add(".js")
  Try
   recurseSolution(AddressOf processItem)
  Catch ex As Exception
   Debug.Print("error in main loop: " + ex.ToString())
  End Try
  Debug.Print("processed items: " + processed.ToString())
  Debug.Print("ignored items: " + ignored.ToString())
  Debug.Print("ignored extensions: " + String.Join(" ", skippedExtensions.ToArray()))
  Debug.Print(errors.ToString())
 End Sub

 Private Sub processItem(ByVal Item As ProjectItem)
  If Not Item.Name.Contains(".") Then
   'Debug.Print("no file extension. ignoring.")
   ignored += 1
   Return
  End If
  Dim ext As String
  ext = Item.Name.Substring(Item.Name.LastIndexOf(".")) 'get file extension
  If allowed.Contains(ext) Then
   formatItem(Item)
   processed += 1
  Else
   'Debug.Print("ignoring file with extension: " + ext)
   If Not skippedExtensions.Contains(ext) Then
    skippedExtensions.Add(ext)
   End If
   ignored += 1
  End If
 End Sub

 Private Sub formatItem(ByVal Item As ProjectItem)
  Debug.Print("processing file " + Item.Name)
  Try
   Dim window As EnvDTE.Window
   window = Item.Open()
   window.Activate()
   DTE.ExecuteCommand("Edit.FormatDocument", "")
   window.Document.Save()
   window.Close()
  Catch ex As Exception
   Debug.Print("error processing file." + ex.ToString())
   errors.Append("error processing file " + Item.Name + "  " + ex.ToString())
  End Try
 End Sub

 Private Delegate Sub task(ByVal Item As ProjectItem)

 Private Sub recurseSolution(ByVal taskRoutine As task)
  For Each Proj As Project In DTE.Solution.Projects
   Debug.Print("project " + Proj.Name)
   For Each Item As ProjectItem In Proj.ProjectItems
    recurseItems(Item, 0, taskRoutine)
   Next
  Next
 End Sub

 Private Sub recurseItems(ByVal Item As ProjectItem, ByVal depth As Integer, ByVal taskRoutine As task)
  Dim indent As String = New String("-", depth)
  Debug.Print(indent + " " + Item.Name)
  If Not Item.ProjectItems Is Nothing Then
   For Each Child As ProjectItem In Item.ProjectItems
    taskRoutine(Child)
    recurseItems(Child, depth + 1, taskRoutine)
   Next
  End If
 End Sub

End Module
```
