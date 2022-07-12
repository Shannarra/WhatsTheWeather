package com.flutter.course.location_plugin;

import android.location.Location;

import androidx.annotation.NonNull;

public interface ILocationCallback {
    void received(@NonNull Location location);
    void unavailable();
}