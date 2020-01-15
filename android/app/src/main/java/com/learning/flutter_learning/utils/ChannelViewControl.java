package com.learning.flutter_learning.utils;

import android.content.Context;
import android.graphics.Color;
import android.view.View;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.platform.PlatformView;

public class ChannelViewControl  implements PlatformView {

    private final View view;

    public ChannelViewControl(Context context, int id, BinaryMessenger messenger) {
        view = new View(context);
        view.setBackgroundColor(Color.parseColor("#ac26bc"));
    }

    @Override
    public View getView() {
        return view;
    }

    @Override
    public void dispose() {
    }
}
