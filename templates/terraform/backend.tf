terraform {
{{- if eq .stack.provider "aws" }}
  backend "s3" {
    bucket = "{{ .terraform.state.bucket }}"
    key    = "{{ .terraform.state.path }}/{{ .kapp.id }}"
    kms_key_id = "{{ .terraform.state.kms_key_id }}"
    region = "{{ .stack.region }}"
  }
{{- else }}
  backend "local" {
    path = "terraform.tfstate"
  }
{{- end }}
}
