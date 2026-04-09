terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd" // VMware Cloud Director APIを利用するための設定
    }
  }
}
provider "vcd" {
  auth_type = "api_token" // 認証方式（固定値）
  api_token = "XXXXXXXX" // 事前に作成したAPIトークン
  org = "svrssa-XXXXXXXX" // 組織名。「API情報」タブに記載
  vdc = "svrssa-XXXXXXXX" // 組織VDC名。「API情報」タブに記載
  url = "https://vcd14.gen2.p2.iijgio.jp/api" // APIエンドポイント。「API情報」タブに記載
  max_retry_timeout = 3 // リトライ回数
}
