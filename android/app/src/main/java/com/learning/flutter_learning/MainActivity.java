package com.learning.flutter_learning;

import android.content.Context;
import android.graphics.Color;
import android.os.Bundle;
import android.os.ParcelUuid;
import android.view.View;

import com.learning.flutter_learning.utils.ChannelViewFactory;

import io.flutter.Log;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;
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

    Registrar registrar = registrarFor("test.lzm/channel_views"); //生成注册类
    ChannelViewFactory channelViewFactory = new ChannelViewFactory(registrar.messenger(), 1); //生成视图工厂
    registrar.platformViewRegistry().registerViewFactory("channelView", channelViewFactory); //注册视图工厂


      //另外一种更改原生背景的
      Registrar otherRegistrar = registrarFor("test.lzm/NativeView"); //生成注册类 這裡好像隨便了，這種方式
      ChannelViewFactory sampleViewFactory = new ChannelViewFactory(registrar.messenger(), 2); //生成视图工厂
      otherRegistrar.platformViewRegistry().registerViewFactory("sampleView", sampleViewFactory); //
  }
}