1. Configure Jenkins:
- Add `dockerhub-creds` (username/password) for Docker Hub.
- Add `kubeconfig` file credential or run Jenkins agents inside the cluster.
- Ensure agents have `docker`, `kubectl`, and `helm` available.
2. Edit `jenkins/Jenkinsfile` to set `DOCKERHUB_REPO`.
3. Build your Java artifacts and place them as `target/*.jar` under each service
directory (or wire up a Maven build stage in the Jenkinsfile before building
images).
4. Run Jenkins pipeline. It will:
- Build and push three service images tagged with the `BUILD_NUMBER`.
- Update `charts/bluegreen-app/values.yaml` green image fields.
- Run `helm upgrade` to deploy the green side, run smoke tests, then cutover
by setting `activeColor=green`.
Notes on Workload Identity and credentials:
- This repository avoids Google service-account JSON keys. If Jenkins runs on
GKE, enable Workload Identity for the Jenkins agent service account to grant it
any GCP permissions it needs.
- Docker Hub authentication uses Jenkins username/password credentials only.
