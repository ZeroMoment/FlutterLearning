package com.learning.flutter_learning.utils;

import android.content.Context;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class ChannelViewFactory extends PlatformViewFactory {

    private final BinaryMessenger messenger;
    private final int platType; //1  2sample

    public ChannelViewFactory(BinaryMessenger msger, int type) {
        super(StandardMessageCodec.INSTANCE);
        messenger = msger;
        platType = type;
    }

    @Override
    public PlatformView create(Context context, int id, Object o) {
        if(platType == 2) {
            return new SampleViewControl(context, id, messenger);
        } else {
            return new ChannelViewControl(context, id, messenger);
        }
    }
}
