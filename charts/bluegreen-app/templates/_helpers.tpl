{{/* helpers for bluegreen-app */}}
{{- define "bg.fullname" -}}
{{- printf "%s-%s" .Release.Name .Values.labels.app | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "bg.name" -}}
{{- printf "%s-%s" .Release.Name .Values.labels.app | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "bg.labels" -}}
app.kubernetes.io/name: {{ .Values.labels.app }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "bg.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.labels.app }}
{{- end -}}
