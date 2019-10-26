{{- define "imagePullSecret" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.docker.registry (printf "%s:%s" .Values.docker.username .Values.docker.password | b64enc) | b64enc }}
{{- end }}