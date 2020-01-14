package com.learning.flutter_learning;

import android.os.Bundle;

import io.flutter.Log;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

  int testCount = 0;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    new MethodChannel(getFlutterView(), "test.lzm/utils").setMethodCallHandler(
            new MethodChannel.MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                Log.e("lzm", "call-method:"+methodCall.method);
                if(methodCall.method.equals("updateProgress")) {
                  testCount++;
                  result.success(testCount);
                } else {
                  result.notImplemented();
                }
              }
            }
    );
  }
}
