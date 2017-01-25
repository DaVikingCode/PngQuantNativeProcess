package  {
	
	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.display.Sprite;
	import flash.events.IOErrorEvent;
	import flash.events.NativeProcessExitEvent;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	import flash.system.Capabilities;
	
	public class Main extends Sprite {
		
		private var process:NativeProcess = new NativeProcess();
		
		public function Main() {
			
			var startupInfo:NativeProcessStartupInfo = new NativeProcessStartupInfo();
			var file:File = File.applicationDirectory;

			var exec:String = "";
			if (Capabilities.os.indexOf("Windows") >= 0)
				exec = "pngquant-windows.cmd";
			else if (Capabilities.os.indexOf("Mac") >= 0)
				exec = "pngquant-osx";
			else
				throw new Error("doesn't work on " + Capabilities.os + " operating system");

			file.nativePath = file.nativePath + "/../" + exec;
			startupInfo.executable = file;

			var processArgs:Vector.<String> = new Vector.<String>();
			processArgs[0] = File.applicationDirectory.nativePath + "/../png-to-compress";
			startupInfo.arguments = processArgs;

			process.start(startupInfo);

			process.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA, onOutputData);
			process.addEventListener(ProgressEvent.STANDARD_ERROR_DATA, onErrorData);
			process.addEventListener(NativeProcessExitEvent.EXIT, onExit);
			process.addEventListener(IOErrorEvent.STANDARD_OUTPUT_IO_ERROR, onIOError);
			process.addEventListener(IOErrorEvent.STANDARD_ERROR_IO_ERROR, onIOError);
		}

		private function onOutputData(event:ProgressEvent):void {
			trace("Got: ", process.standardOutput.readUTFBytes(process.standardOutput.bytesAvailable)); 
		}

		private function onErrorData(event:ProgressEvent):void {
			trace("ERROR -", process.standardError.readUTFBytes(process.standardError.bytesAvailable)); 
		}

		private function onExit(event:NativeProcessExitEvent):void {
			trace("Process exited with ", event.exitCode);
		}

		private function onIOError(event:IOErrorEvent):void {
			 trace(event.toString());
		}
	}
}