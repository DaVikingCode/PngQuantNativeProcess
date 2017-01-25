using UnityEngine;

public class Script : MonoBehaviour {

	void Start () {

		System.Diagnostics.Process.Start(Application.dataPath + "/../../pngquant-osx", Application.dataPath + "/../../png-to-compress");
	}

}
