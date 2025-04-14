# Grafana Dashboard 구성
이 저장소는 Kubernetes 환경에서 Grafana 대시보드를 ConfigMap으로 배포하기 위한 대시보드 JSON 파일과 자동화 스크립트를 제공합니다.

<br>

## 대시보드 목록
1. **Blackbox Exporter 대시보드**
    - 엔드포인트 상태 모니터링
    - HTTP 프로브 응답 시간 추적 및 시각화
    - SSL 상태 및 만료 정보 표시

2. **MSK 대시보드**
    - 브로커, 컨트롤러 상태 및 토픽, 파티션 갯수 
    - 토픽 및 파티션별 메시지 처리 지연 시간 추적
    - Consumer Lags 지표 모니터링
    - Java Memory 모니터링

<br>

## 배포 설정
kube-prometheus-stack의 `values.yaml` 파일은 다음과 같이 구성되어 있어 라벨이 일치하는 ConfigMap을 자동으로 대시보드로 등록합니다

```yaml
grafana: 
  sidecar:
    dashboards:
      enabled: true
      label: grafana_dashboard
      labelValue: "1"
      # Allow discovery in all namespaces for dashboards
      searchNamespace: ALL
```

<br>

## 사용 방법
```bash
chmod +x create-dashboard-cm.sh

./create-dashboard-cm.sh
```

<br>

## 추가 정보
대시보드 JSON 파일은 필요에 따라 커스터마이징 가능합니다.

새로운 대시보드를 추가하려면 JSON 파일을 `dashboards/` 추가하고 스크립트에 항목을 추가해주세요.

