# bluray ripping

blurays are usually DRM protected. to access your property you need `libbluray` and `libaacs`.
libaacs requires a valid `~/.config/aacs/KEYDB.cfg` which is not part of the library.

```
wget http://fvonline-db.bplaced.net/fv_download.php?lang=eng -O keydb.zip
```

## probe bluray

```
$ ffprobe bluray:/dev/sr0
[bluray @ 0x59e1edc75e00] 7 usable playlists:
[bluray @ 0x59e1edc75e00] playlist 00031.mpls (0:45:33)
[bluray @ 0x59e1edc75e00] playlist 00027.mpls (3:47:40)
[bluray @ 0x59e1edc75e00] playlist 00044.mpls (0:45:32)
[bluray @ 0x59e1edc75e00] playlist 00042.mpls (0:45:32)
[bluray @ 0x59e1edc75e00] playlist 00041.mpls (0:45:33)
[bluray @ 0x59e1edc75e00] playlist 00040.mpls (0:45:32)
[bluray @ 0x59e1edc75e00] playlist 00094.mpls (0:05:00)
[bluray @ 0x59e1edc75e00] selected 00027.mpls
    
Input #0, mpegts, from 'bluray:/dev/sr0':
  Duration: 25:30:45.72, start: 4199.000000, bitrate: 3802 kb/s
  Program 1 
  Stream #0:0[0x1011]: Video: h264 (High) (HDMV / 0x564D4448), yuv420p(progressive), 1920x1080 [SAR 1:1 DAR 16:9], 23.98 fps, 23.98 tbr, 90k tbn
  Stream #0:1[0x1100]: Audio: dts (dca) (DTS-HD MA) ([134][0][0][0] / 0x0086), 48000 Hz, 7.1, s32p (24 bit)
  Stream #0:2[0x1101]: Audio: ac3 (AC-3 / 0x332D4341), 48000 Hz, stereo, fltp, 192 kb/s
  Stream #0:3[0x1102]: Audio: ac3 (AC-3 / 0x332D4341), 48000 Hz, stereo, fltp, 192 kb/s
  Stream #0:4[0x1103]: Audio: ac3 (AC-3 / 0x332D4341), 48000 Hz, stereo, fltp, 192 kb/s
  Stream #0:5[0x1104]: Audio: ac3 (AC-3 / 0x332D4341), 48000 Hz, stereo, fltp, 192 kb/s
  Stream #0:6[0x1105]: Audio: ac3 (AC-3 / 0x332D4341), 48000 Hz, stereo, fltp, 192 kb/s
  Stream #0:7[0x1106]: Audio: ac3 (AC-3 / 0x332D4341), 48000 Hz, stereo, fltp, 192 kb/s
  Stream #0:8[0x1200]: Subtitle: hdmv_pgs_subtitle (pgssub) ([144][0][0][0] / 0x0090), 1920x1080
  Stream #0:9[0x1201]: Subtitle: hdmv_pgs_subtitle (pgssub) ([144][0][0][0] / 0x0090), 1920x1080
  Stream #0:10[0x1202]: Subtitle: hdmv_pgs_subtitle (pgssub) ([144][0][0][0] / 0x0090), 1920x1080
  Stream #0:11[0x1203]: Subtitle: hdmv_pgs_subtitle (pgssub) ([144][0][0][0] / 0x0090), 1920x1080
  Stream #0:12[0x1204]: Subtitle: hdmv_pgs_subtitle (pgssub) ([144][0][0][0] / 0x0090), 1920x1080
  Stream #0:13[0x1205]: Subtitle: hdmv_pgs_subtitle (pgssub) ([144][0][0][0] / 0x0090), 1920x1080
  Stream #0:14[0x1206]: Subtitle: hdmv_pgs_subtitle (pgssub) ([144][0][0][0] / 0x0090), 1920x1080
  Stream #0:15[0x1207]: Subtitle: hdmv_pgs_subtitle (pgssub) ([144][0][0][0] / 0x0090), 1920x1080
  Stream #0:16[0x1208]: Subtitle: hdmv_pgs_subtitle (pgssub) ([144][0][0][0] / 0x0090), 1920x1080
  Stream #0:17[0x1209]: Subtitle: hdmv_pgs_subtitle (pgssub) ([144][0][0][0] / 0x0090), 1920x1080
  Stream #0:18[0x120a]: Subtitle: hdmv_pgs_subtitle (pgssub) ([144][0][0][0] / 0x0090), 1920x1080
```

```
ffplay -playlist 31 bluray:/dev/sr0
```

## extract (libbluray style)

```
$ bd_list_titles /dev/sr0 
Main title: 2
index:   1 duration: 00:45:33 chapters:   8 angles:  1 clips:   2 (playlist: 00031.mpls) V:1 A:7  PG:11 IG:1  SV:0 SA:0
index:   2 duration: 03:47:40 chapters:  36 angles:  1 clips:   6 (playlist: 00027.mpls) V:1 A:7  PG:11 IG:1  SV:0 SA:0
index:   3 duration: 00:45:32 chapters:   8 angles:  1 clips:   2 (playlist: 00044.mpls) V:1 A:7  PG:11 IG:1  SV:0 SA:0
index:   4 duration: 00:45:32 chapters:   8 angles:  1 clips:   2 (playlist: 00042.mpls) V:1 A:7  PG:11 IG:1  SV:0 SA:0
index:   5 duration: 00:45:33 chapters:   8 angles:  1 clips:   2 (playlist: 00041.mpls) V:1 A:7  PG:11 IG:1  SV:0 SA:0
```

```
$ bd_splice -t 4 /dev/sr0 ./track4.m2ts
```

## extract (ffmpeg style)

```
$ ffmpeg -playlist 31 -i bluray:/dev/sr0 \
  -c:v copy -c:a copy -c:s copy \
  -map ß:v -map 0:a -map 0:s \
  -metadata:s:a:0 title="$title" -metadata:s:a:0 laguage="$iso-code" \
  -metadata:s:s:0 title="$title" -metadata:s:s:0 laguage="$iso-code" -metadata:s:s:0 handler="$handler" \
  -t "00:45:33" \
  playlist31.mkv
```
