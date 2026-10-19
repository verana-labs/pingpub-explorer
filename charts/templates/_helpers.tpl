{{- define "pingpub-explorer.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end -}}

{{- define "pingpub-explorer.labels" -}}
app.kubernetes.io/name: {{ include "pingpub-explorer.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "pingpub-explorer.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pingpub-explorer.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
