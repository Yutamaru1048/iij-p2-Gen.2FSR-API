# IIJ P2 Gen.2 FSR-API
TerraformでフレキシブルサーバリソースAPIを利用する

IIJ P2 Gen.2 VPC のフレキシブルサーバリソースを Terraform で構築するための検証コードです。

### 概要
公式マニュアルを参考に、インフラ構成のコード化を試行しました。  
手動での構築ミスを防ぎ、環境の再現性を高めることを目的としています。

本検証では、FSR上に構築した Windows Server 2019 を実行環境（管理機）とし、そこから  
Terraform を用いて Windows Server 2022 を自動デプロイする構成をとっています。

### 構成・環境
・実行環境 (Control Plane): Windows Server 2019 (FSR VM)  
・プロビジョニング対象 (Target): Windows Server 2022  
・使用ツール: Terraform (IIJ P2 Gen.2 Flexible Server Resource API)

 ### 構成ファイル
・"auth_sample.tf": APIトークンを使用したプロバイダー（接続先）の設定  
・"reate.tf": vAppおよび仮想マシン（Windows 2022）の定義


### 実行手順
1. FSR内に作成したWindows2019の仮想マシンにterraformをインストール
2. ダウンロードした terraform を、作業したいフォルダ（任意のフォルダ）へ置く。
3. パワーシェルで terraform と打って応答が返ってくれば完了
4. Terraformのコード（tfファイル）を管理するための専用フォルダを別途作成する。
5. 認証のための設定ファイルと（auth_sample.tf）インフラ環境構築のための設定ファイル（create.tf）を作成
6. terraform init を実行し、プロバイダーを初期化
7. terraform plan で作成されるリソースを確認
8. terraform apply で実際にデプロイ
9. Windws2022の仮想マシンが作成されたことを確認

### 参考資料
- [IIJ公式マニュアル：TerraformでフレキシブルサーバリソースAPIを利用する](https://manual.iij.jp/p2/vpc/53267628.html)
