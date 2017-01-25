using System;
using UnityEngine;

public class Script : MonoBehaviour {

	void Start () {

		System.Diagnostics.Process process = new  System.Diagnostics.Process();

		process.EnableRaisingEvents = true;
		process.Exited += (sender, e) => { Debug.Log("process completed"); };

		string exec = "";
		if (Application.platform == RuntimePlatform.WindowsEditor || Application.platform == RuntimePlatform.WindowsPlayer)
			exec = "pngquant-windows.cmd";
		else if (Application.platform == RuntimePlatform.OSXEditor || Application.platform == RuntimePlatform.OSXPlayer)
			exec = "pngquant-osx";
		else
			throw new Exception("Platform not supported");

		process.StartInfo.FileName = Application.dataPath + "/../../" + exec;
		process.StartInfo.Arguments = Application.dataPath + "/../../png-to-compress";

		process.Start();
	}
}