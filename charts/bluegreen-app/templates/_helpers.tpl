{{/* helpers for bluegreen-app */}}

{{- /* BG helpers */ -}}
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

{{- /* Aliases for bluegreen.* so existing templates work */ -}}
{{- define "bluegreen.fullname" -}}
{{- include "bg.fullname" . -}}
{{- end -}}

{{- define "bluegreen.name" -}}
{{- include "bg.name" . -}}
{{- end -}}

{{- define "bluegreen.labels" -}}
{{- include "bg.labels" . -}}
{{- end -}}

{{- define "bluegreen.selectorLabels" -}}
{{- include "bg.selectorLabels" . -}}
{{- end -}}
