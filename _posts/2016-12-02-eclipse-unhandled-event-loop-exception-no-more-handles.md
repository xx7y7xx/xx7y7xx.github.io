---
layout: post
title: "Eclipse: Unhandled event loop exception No more handles"
---

![](/attachments/screenshot_20161202_222241.jpg)

Event details

Messsage:

```
Unhandled event loop exception
```

Exception Stack Trace:

```
org.eclipse.swt.SWTError: No more handles
	at org.eclipse.swt.SWT.error(SWT.java:4559)
	at org.eclipse.swt.SWT.error(SWT.java:4448)
	at org.eclipse.swt.SWT.error(SWT.java:4419)
	at org.eclipse.swt.widgets.Widget.error(Widget.java:482)
	at org.eclipse.swt.widgets.Control.createHandle(Control.java:718)
	at org.eclipse.swt.widgets.Label.createHandle(Label.java:202)
	at org.eclipse.swt.widgets.Control.createWidget(Control.java:758)
	at org.eclipse.swt.widgets.Control.<init>(Control.java:112)
	at org.eclipse.swt.widgets.Label.<init>(Label.java:102)
	at org.eclipse.ui.texteditor.StatusLineContributionItem.fill(StatusLineContributionItem.java:165)
	at org.eclipse.jface.action.SubContributionItem.fill(SubContributionItem.java:58)
	at org.eclipse.jface.action.StatusLineManager.update(StatusLineManager.java:290)
	at org.eclipse.ui.internal.WorkbenchPage.updateActivations(WorkbenchPage.java:313)
	at org.eclipse.ui.internal.WorkbenchPage.access$18(WorkbenchPage.java:291)
	at org.eclipse.ui.internal.WorkbenchPage$E4PartListener.partActivated(WorkbenchPage.java:209)
	at org.eclipse.e4.ui.internal.workbench.PartServiceImpl$3.run(PartServiceImpl.java:250)
	at org.eclipse.core.runtime.SafeRunner.run(SafeRunner.java:42)
	at org.eclipse.e4.ui.internal.workbench.PartServiceImpl.firePartActivated(PartServiceImpl.java:247)
	at org.eclipse.e4.ui.internal.workbench.PartServiceImpl.activate(PartServiceImpl.java:757)
	at org.eclipse.e4.ui.internal.workbench.PartServiceImpl.activate(PartServiceImpl.java:682)
	at org.eclipse.e4.ui.internal.workbench.swt.AbstractPartRenderer.activate(AbstractPartRenderer.java:95)
	at org.eclipse.e4.ui.workbench.renderers.swt.ContributedPartRenderer$1.handleEvent(ContributedPartRenderer.java:63)
	at org.eclipse.swt.widgets.EventTable.sendEvent(EventTable.java:84)
	at org.eclipse.swt.widgets.Display.sendEvent(Display.java:4410)
	at org.eclipse.swt.widgets.Widget.sendEvent(Widget.java:1079)
	at org.eclipse.swt.widgets.Widget.sendEvent(Widget.java:1103)
	at org.eclipse.swt.widgets.Widget.sendEvent(Widget.java:1088)
	at org.eclipse.swt.widgets.Shell.setActiveControl(Shell.java:1542)
	at org.eclipse.swt.widgets.Shell.WM_MOUSEACTIVATE(Shell.java:2467)
	at org.eclipse.swt.widgets.Control.windowProc(Control.java:4835)
	at org.eclipse.swt.widgets.Canvas.windowProc(Canvas.java:359)
	at org.eclipse.swt.widgets.Decorations.windowProc(Decorations.java:1656)
	at org.eclipse.swt.widgets.Shell.windowProc(Shell.java:2199)
	at org.eclipse.swt.widgets.Display.windowProc(Display.java:5115)
	at org.eclipse.swt.internal.win32.OS.DefWindowProcW(Native Method)
	at org.eclipse.swt.internal.win32.OS.DefWindowProc(OS.java:2547)
	at org.eclipse.swt.widgets.Scrollable.callWindowProc(Scrollable.java:88)
	at org.eclipse.swt.widgets.Control.windowProc(Control.java:4889)
	at org.eclipse.swt.widgets.Display.windowProc(Display.java:5115)
	at org.eclipse.swt.internal.win32.OS.DefWindowProcW(Native Method)
	at org.eclipse.swt.internal.win32.OS.DefWindowProc(OS.java:2547)
	at org.eclipse.swt.widgets.Scrollable.callWindowProc(Scrollable.java:88)
	at org.eclipse.swt.widgets.Control.windowProc(Control.java:4889)
	at org.eclipse.swt.widgets.Display.windowProc(Display.java:5115)
	at org.eclipse.swt.internal.win32.OS.DefWindowProcW(Native Method)
	at org.eclipse.swt.internal.win32.OS.DefWindowProc(OS.java:2547)
	at org.eclipse.swt.widgets.Scrollable.callWindowProc(Scrollable.java:88)
	at org.eclipse.swt.widgets.Control.windowProc(Control.java:4889)
	at org.eclipse.swt.widgets.Display.windowProc(Display.java:5115)
	at org.eclipse.swt.internal.win32.OS.DefWindowProcW(Native Method)
	at org.eclipse.swt.internal.win32.OS.DefWindowProc(OS.java:2547)
	at org.eclipse.swt.widgets.Scrollable.callWindowProc(Scrollable.java:88)
	at org.eclipse.swt.widgets.Control.windowProc(Control.java:4889)
	at org.eclipse.swt.widgets.Display.windowProc(Display.java:5115)
	at org.eclipse.swt.internal.win32.OS.DefWindowProcW(Native Method)
	at org.eclipse.swt.internal.win32.OS.DefWindowProc(OS.java:2547)
	at org.eclipse.swt.widgets.Scrollable.callWindowProc(Scrollable.java:88)
	at org.eclipse.swt.widgets.Control.windowProc(Control.java:4889)
	at org.eclipse.swt.widgets.Display.windowProc(Display.java:5115)
	at org.eclipse.swt.internal.win32.OS.DefWindowProcW(Native Method)
	at org.eclipse.swt.internal.win32.OS.DefWindowProc(OS.java:2547)
	at org.eclipse.swt.widgets.Scrollable.callWindowProc(Scrollable.java:88)
	at org.eclipse.swt.widgets.Control.windowProc(Control.java:4889)
	at org.eclipse.swt.widgets.Display.windowProc(Display.java:5115)
	at org.eclipse.swt.internal.win32.OS.DefWindowProcW(Native Method)
	at org.eclipse.swt.internal.win32.OS.DefWindowProc(OS.java:2547)
	at org.eclipse.swt.widgets.Scrollable.callWindowProc(Scrollable.java:88)
	at org.eclipse.swt.widgets.Control.windowProc(Control.java:4889)
	at org.eclipse.swt.widgets.Display.windowProc(Display.java:5115)
	at org.eclipse.swt.internal.win32.OS.DefWindowProcW(Native Method)
	at org.eclipse.swt.internal.win32.OS.DefWindowProc(OS.java:2547)
	at org.eclipse.swt.widgets.Scrollable.callWindowProc(Scrollable.java:88)
	at org.eclipse.swt.widgets.Control.windowProc(Control.java:4889)
	at org.eclipse.swt.widgets.Display.windowProc(Display.java:5115)
	at org.eclipse.swt.internal.win32.OS.DefWindowProcW(Native Method)
	at org.eclipse.swt.internal.win32.OS.DefWindowProc(OS.java:2547)
	at org.eclipse.swt.widgets.Scrollable.callWindowProc(Scrollable.java:88)
	at org.eclipse.swt.widgets.Control.windowProc(Control.java:4889)
	at org.eclipse.swt.widgets.Display.windowProc(Display.java:5115)
	at org.eclipse.swt.internal.win32.OS.DefWindowProcW(Native Method)
	at org.eclipse.swt.internal.win32.OS.DefWindowProc(OS.java:2547)
	at org.eclipse.swt.widgets.Scrollable.callWindowProc(Scrollable.java:88)
	at org.eclipse.swt.widgets.Control.windowProc(Control.java:4889)
	at org.eclipse.swt.widgets.Display.windowProc(Display.java:5115)
	at org.eclipse.swt.internal.win32.OS.DefWindowProcW(Native Method)
	at org.eclipse.swt.internal.win32.OS.DefWindowProc(OS.java:2547)
	at org.eclipse.swt.widgets.Scrollable.callWindowProc(Scrollable.java:88)
	at org.eclipse.swt.widgets.Control.windowProc(Control.java:4889)
	at org.eclipse.swt.widgets.Display.windowProc(Display.java:5115)
	at org.eclipse.swt.internal.win32.OS.DefWindowProcW(Native Method)
	at org.eclipse.swt.internal.win32.OS.DefWindowProc(OS.java:2547)
	at org.eclipse.swt.widgets.Scrollable.callWindowProc(Scrollable.java:88)
	at org.eclipse.swt.widgets.Control.windowProc(Control.java:4889)
	at org.eclipse.swt.widgets.Display.windowProc(Display.java:5115)
	at org.eclipse.swt.internal.win32.OS.DefWindowProcW(Native Method)
	at org.eclipse.swt.internal.win32.OS.DefWindowProc(OS.java:2547)
	at org.eclipse.swt.widgets.Scrollable.callWindowProc(Scrollable.java:88)
	at org.eclipse.swt.widgets.Control.windowProc(Control.java:4889)
	at org.eclipse.swt.widgets.Display.windowProc(Display.java:5115)
	at org.eclipse.swt.internal.win32.OS.DefWindowProcW(Native Method)
	at org.eclipse.swt.internal.win32.OS.DefWindowProc(OS.java:2547)
	at org.eclipse.swt.widgets.Scrollable.callWindowProc(Scrollable.java:88)
	at org.eclipse.swt.widgets.Control.windowProc(Control.java:4889)
	at org.eclipse.swt.widgets.Canvas.windowProc(Canvas.java:359)
	at org.eclipse.swt.widgets.Display.windowProc(Display.java:5115)
	at org.eclipse.swt.internal.win32.OS.DefWindowProcW(Native Method)
	at org.eclipse.swt.internal.win32.OS.DefWindowProc(OS.java:2547)
	at org.eclipse.swt.widgets.Scrollable.callWindowProc(Scrollable.java:88)
	at org.eclipse.swt.widgets.Control.windowProc(Control.java:4889)
	at org.eclipse.swt.widgets.Canvas.windowProc(Canvas.java:359)
	at org.eclipse.swt.widgets.Display.windowProc(Display.java:5115)
	at org.eclipse.swt.internal.win32.OS.PeekMessageW(Native Method)
	at org.eclipse.swt.internal.win32.OS.PeekMessage(OS.java:3144)
	at org.eclipse.swt.widgets.Display.readAndDispatch(Display.java:3811)
	at org.eclipse.e4.ui.internal.workbench.swt.PartRenderingEngine$4.run(PartRenderingEngine.java:1121)
	at org.eclipse.core.databinding.observable.Realm.runWithDefault(Realm.java:336)
	at org.eclipse.e4.ui.internal.workbench.swt.PartRenderingEngine.run(PartRenderingEngine.java:1022)
	at org.eclipse.e4.ui.internal.workbench.E4Workbench.createAndRunUI(E4Workbench.java:150)
	at org.eclipse.ui.internal.Workbench$5.run(Workbench.java:687)
	at org.eclipse.core.databinding.observable.Realm.runWithDefault(Realm.java:336)
	at org.eclipse.ui.internal.Workbench.createAndRunWorkbench(Workbench.java:604)
	at org.eclipse.ui.PlatformUI.createAndRunWorkbench(PlatformUI.java:148)
	at org.eclipse.ui.internal.ide.application.IDEApplication.start(IDEApplication.java:138)
	at org.eclipse.equinox.internal.app.EclipseAppHandle.run(EclipseAppHandle.java:196)
	at org.eclipse.core.runtime.internal.adaptor.EclipseAppLauncher.runApplication(EclipseAppLauncher.java:134)
	at org.eclipse.core.runtime.internal.adaptor.EclipseAppLauncher.start(EclipseAppLauncher.java:104)
	at org.eclipse.core.runtime.adaptor.EclipseStarter.run(EclipseStarter.java:388)
	at org.eclipse.core.runtime.adaptor.EclipseStarter.run(EclipseStarter.java:243)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(Unknown Source)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(Unknown Source)
	at java.lang.reflect.Method.invoke(Unknown Source)
	at org.eclipse.equinox.launcher.Main.invokeFramework(Main.java:673)
	at org.eclipse.equinox.launcher.Main.basicRun(Main.java:610)
	at org.eclipse.equinox.launcher.Main.run(Main.java:1519)
```

Session Data:

```
eclipse.buildId=4.6.1.M20160907-1200
java.version=1.8.0_111
java.vendor=Oracle Corporation
BootLoader constants: OS=win32, ARCH=x86_64, WS=win32, NL=zh_CN
Framework arguments:  -product org.eclipse.epp.package.java.product
Command-line arguments:  -os win32 -ws win32 -arch x86_64 -product org.eclipse.epp.package.java.product
```

How to fix:

As said in [http://stackoverflow.com/a/19811529/4685522](http://stackoverflow.com/a/19811529/4685522):

> In your TeamViewer go to: Extras > Options > Advanced > "QuickConnect button" configure it and disable the show QuickConnect button.

## References

- [http://stackoverflow.com/questions/15594590/eclipse-bug-unhandled-event-loop-exception-no-more-handles](http://stackoverflow.com/questions/15594590/eclipse-bug-unhandled-event-loop-exception-no-more-handles)