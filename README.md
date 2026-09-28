# 🛡️ Enterprise-Grade DevSecOps Pipeline

![DevSecOps CI Pipeline](https://github.com/sankalpa-devsec/secure-app/actions/workflows/security-scan.yml/badge.svg)
![Docker](https://img.shields.io/badge/Docker-Hardened-blue?logo=docker)
![Security](https://img.shields.io/badge/Security-Trivy%20%7C%20Gitleaks-brightgreen)

An end-to-end automated DevSecOps CI/CD security pipeline implemented with **GitHub Actions**, demonstrating Shift-Left security principles for containerized microservices.

---

## 🔍 Security Gates & Architecture

Every commit triggers an automated pipeline enforcing strict security gates:

1. **Secret Detection (Gitleaks):** Scans git commits and code for leaked API keys, tokens, and credentials.
2. **Container Hardening (Docker):**
   - Built on minimal Alpine base image (`node:22-alpine`)
   - Up-to-date OS packages with zero critical vulnerabilities
   - Non-root user execution (`USER node`) to minimize attack surface
3. **Vulnerability Assessment (Trivy):**
   - Automatically fails the build (`exit-code: 1`) on any unfixed **HIGH** or **CRITICAL** CVEs.

---

## 🚀 Pipeline Workflow

```text
[Developer Push]
       │
       ▼
[Gitleaks Secret Scan] ──(Fails if credentials exposed)
       │
       ▼
[Docker Image Build]
       │
       ▼
[Trivy Container Scan] ──(Fails on HIGH/CRITICAL CVEs)
       │
       ▼
[✅ Secure Artifact Ready]
```
## 🛠️ Local Verification

To run security checks locally prior to pushing:

```bash
# Run Trivy locally
trivy image --severity CRITICAL,HIGH secure-app:latest

# Run Gitleaks locally
docker run --rm -v $(pwd):/path zricethezav/gitleaks:latest detect --source="/path" --verbose
