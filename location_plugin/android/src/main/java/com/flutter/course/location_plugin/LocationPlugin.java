package com.flutter.course.location_plugin;

import android.location.Location;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;

/**
 * LocationPlugin
 */
public class LocationPlugin implements FlutterPlugin, LocationMessages.LocationApi, ActivityAware {
    @NonNull
    private final LocationHandler handler = new LocationHandler();

    @Nullable
    private ActivityPluginBinding pluginBinding;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        LocationMessages.LocationApi.setup(flutterPluginBinding.getBinaryMessenger(), this);
    }


    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        LocationMessages.LocationApi.setup(binding.getBinaryMessenger(), null);
    }

    @Override
    public void getCurrentLocation(LocationMessages.Result<LocationMessages.LocationResult> result) {
        handler.requestLocation(new ILocationCallback() {
            @Override
            public void received(@NonNull Location location) {

                final LocationMessages.LocationResult data =
                        new LocationMessages.LocationResult.Builder()
                                .setLatitude(location.getLatitude())
                                .setLongitude(location.getLongitude())
                                .build();


                result.success(data);
            }

            @Override
            public void unavailable() {
                result.success(null);
            }
        });
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        this.pluginBinding = binding;
        handler.setActivity(binding.getActivity());
        binding.addRequestPermissionsResultListener(handler);
    }

    @Override
    public void onDetachedFromActivity() {
        handler.setActivity(null);
        if (this.pluginBinding != null) {
            this.pluginBinding.removeRequestPermissionsResultListener(handler);
            this.pluginBinding = null;
        }
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        this.onDetachedFromActivity();
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        this.onAttachedToActivity(binding);
    }
}
