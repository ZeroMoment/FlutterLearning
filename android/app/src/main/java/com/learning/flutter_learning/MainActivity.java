package com.learning.flutter_learning;

import androidx.annotation.NonNull;

import com.learning.flutter_learning.utils.ChannelViewFactory;

import io.flutter.Log;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.util.GeneratedPluginRegister;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {

  int testCount = 0;
  BinaryMessenger binaryMessenger;

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
//    GeneratedPluginRegister.registerGeneratedPlugins(flutterEngine); 这一行貌似没啥用？
    binaryMessenger = flutterEngine.getDartExecutor().getBinaryMessenger();

    new MethodChannel(binaryMessenger, "test.lzm/utils").setMethodCallHandler(
            new MethodChannel.MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                Log.e("lzm", "call-method:" + methodCall.method);
                if (methodCall.method.equals("updateProgress")) {
                  testCount++;
                  result.success(testCount);
                } else {
                  result.notImplemented();
                }
              }
            }
    );

    flutterEngine.getPlugins().add(new MyPlugin());
  }
}

class MyPlugin implements FlutterPlugin {

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
    BinaryMessenger messenger = binding.getBinaryMessenger();
    ChannelViewFactory channelViewFactory = new ChannelViewFactory(messenger, 1); //生成视图工厂
    binding.getPlatformViewRegistry().registerViewFactory("test.lzm/channelView", channelViewFactory); //注册视图工厂

    //另外一种更改原生背景的
    ChannelViewFactory sampleViewFactory = new ChannelViewFactory(messenger, 2); //生成视图工厂
    binding.getPlatformViewRegistry().registerViewFactory("test.lzm/sampleView", sampleViewFactory);
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {

  }
}

