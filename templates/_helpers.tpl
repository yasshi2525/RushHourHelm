{{- define "imagePullSecret" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .host (printf "%s:%s" .user .password | b64enc) | b64enc }}
{{- end }}
{{- define "dbSpec" }}
{{- printf "%s:%s@tcp(%s:%.0f)/%s?parseTime=true" .user .password .host ( .port | default 3306.0 ) .database }}
{{- end -}}