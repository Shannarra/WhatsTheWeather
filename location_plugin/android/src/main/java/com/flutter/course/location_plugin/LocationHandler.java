package com.flutter.course.location_plugin;

import static androidx.core.content.PermissionChecker.PERMISSION_DENIED;
import static androidx.core.content.PermissionChecker.PERMISSION_GRANTED;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.location.Criteria;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Build;
import android.provider.Settings;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import java.util.List;

import io.flutter.plugin.common.PluginRegistry;

public class LocationHandler implements LocationListener, PluginRegistry.RequestPermissionsResultListener {
    private static final int REQ_CODE = 293032;
    private static final String[] permissions = new String[]{
            Manifest.permission.ACCESS_COARSE_LOCATION,
    };

    @Nullable
    private LocationManager locationManager;

    @Nullable
    private Activity activity;

    @Nullable
    private ILocationCallback callback;

    public void setActivity(@Nullable Activity activity) {
        this.activity = activity;
    }

    public void requestLocation(@NonNull ILocationCallback callback) {
        stopError();

        if (activity == null) {
            callback.unavailable();
            return;
        }

        this.callback = callback;

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            for (String permission : permissions) {
                int i = ContextCompat.checkSelfPermission(activity, permission);
                if (i != PERMISSION_GRANTED) {
                    ActivityCompat.requestPermissions(activity, permissions, REQ_CODE);
                    return;
                }
            }
        }
        requestCurrentLocation();
    }

    private void requestCurrentLocation() {
        try {
            assert activity != null;
            deInitLocationManager();

            locationManager = (LocationManager) activity.getSystemService(Context.LOCATION_SERVICE);


            assert locationManager != null;

            List<String> providers = locationManager.getProviders(true);
            providers = providers.isEmpty() ? locationManager.getProviders(false) : providers;

            String provider = providers.isEmpty() ? LocationManager.PASSIVE_PROVIDER : providers.get(0);

            if (!locationManager.isProviderEnabled(provider))
                ContextCompat.startActivity(activity, new Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS), null);

            final Location lastKnown = locationManager.getLastKnownLocation(provider);

            if (lastKnown != null) {
                stopSuccess(lastKnown);

                return;
            }

            locationManager.requestLocationUpdates(provider, 0, 0, this);
        } catch (Exception e) {
            stopError();
        }
    }

    private void deInitLocationManager() {
        if (locationManager != null) {
            locationManager.removeUpdates(this);
            locationManager = null;
        }
    }

    private void stopSuccess(@NonNull Location location) {
        deInitLocationManager();
        if (callback != null) {
            callback.received(location);
            callback = null;
        }
    }

    private void stopError() {
        deInitLocationManager();
        if (callback != null) {
            callback.unavailable();
            callback = null;
        }
    }


    @Override
    public boolean onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {

        if (requestCode == REQ_CODE) {
            for (int result : grantResults) {
                if (result == PERMISSION_DENIED) {
                    stopError();
                    return true;
                }
            }
            requestCurrentLocation();
            return true;
        }
        return false;
    }

    @Override
    public void onProviderEnabled(@NonNull String provider) {
        if (callback != null)
            requestCurrentLocation();
    }

    @Override
    public void onProviderDisabled(@NonNull String provider) {
    }

    @Override
    public void onLocationChanged(@NonNull Location location) {
        stopSuccess(location);
    }
}

