{{range .configList}}
- type: log
  enabled: true
  paths:
      - {{ .HostDir }}/{{ .File }}
  fields:
      {{range $key, $value := .Tags}}
      {{ $key }}: {{ $value }}
      {{end}}
      {{range $key, $value := $.container}}
      {{ $key }}: {{ $value }}
      {{end}}
  json.keys_under_root: true
  json.add_error_key: true
  json.overwrite_keys: true
  encoding: utf-8
  clean_removed: true
  close_renamed: true
  scan_frequency: 100ms
  close_removed: false
  ignore_older: 48h
  clean_inactive: 72h                                                                                            

{{end}}

