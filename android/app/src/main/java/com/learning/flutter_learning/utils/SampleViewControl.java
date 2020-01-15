package com.learning.flutter_learning.utils;

import android.content.Context;
import android.graphics.Color;
import android.view.View;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

public class SampleViewControl implements PlatformView, MethodChannel.MethodCallHandler {

    private final MethodChannel methodChannel;
    private final View view;

    public SampleViewControl(Context context, int id, BinaryMessenger messenger) {


        view = new View(context);
        view.setBackgroundColor(Color.parseColor("#ac26bc"));

        methodChannel = new MethodChannel(messenger, "test.lzm/sample_views_"+id);
        methodChannel.setMethodCallHandler(this);
    }

    @Override
    public View getView() {
        return view;
    }

    @Override
    public void dispose() {
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        if(methodCall.method.equals("changeBgColor")) {
            view.setBackgroundColor(Color.parseColor("#2323be"));
            result.success(0);
        } else {
            result.notImplemented();
        }
    }
}
