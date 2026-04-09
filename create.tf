// OSライブラリ
data "vcd_catalog" "win_lib" {
  org  = "os-library" // 組織名（固定値）
  name = "OSライセンス：Windows" // カタログ名（固定値）
}
// OSテンプレート
data "vcd_catalog_vapp_template" "win2022" {
  catalog_id = data.vcd_catalog.win_lib.id // vcd_catalogのIDを参照
  name = "Windows Server 2022 (1.4)" // 実在のOSテンプレートの名前
}
// vAppの定義
resource "vcd_vapp" "tfmvappex" {
  name = "tfmvappex" // vApp: 名前
  description = "Terraform Example" // vApp: 説明
  power_on = false // 電源の状態
}
// vAppに属する仮想マシンの定義
resource "vcd_vapp_vm" "tfmvappvmex" {
  vapp_name = vcd_vapp.tfmvappex.name // vcd_vappの名前を参照
  name = "tfmvappvmex" // 仮想マシン名
  vapp_template_id = data.vcd_catalog_vapp_template.almalinux9.id  // vcd_catalog_vapp_templateのIDを参照
  cpus = 2 // 仮想CPUの数
  cpu_cores = 1 // ソケットあたりのコア数
  memory = 2048 // メモリのサイズ（MB）
  power_on = false // 電源の状態
  accept_all_eulas = true // EULAに同意する
  computer_name = "tfmvappvmex01" // コンピュータ名
  storage_profile = "basic" // 利用するストレージのプロファイル名、"basic"か"standard"を指定
}
