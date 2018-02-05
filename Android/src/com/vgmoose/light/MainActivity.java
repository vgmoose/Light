package com.vgmoose.light;

import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebView;

public class MainActivity extends Activity
{

	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		WebView conversation = (WebView)(this.findViewById(R.id.webview));
		conversation.loadUrl("file:///android_asset/chat.html");
	}
}
