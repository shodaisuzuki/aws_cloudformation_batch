# INTRO

CloudWatch Events + lambdaの構成でバッチを作成する。
上記リソースをCloudFormationテンプレートに定義しコマンドだけで構築する。

# 使い方

script配下の2つのスクリプトで環境を構築し、
スケジュール対象にしたいRDSに対しタグ「state-scheduler: True」を付与する。
タグ「state-scheduler: True」が付与されているRDSがスケジュール対象になる。

# AWSリソースの役割

## CloudWatch Events

cronスケジュールを設定し、アクションでlambda関数をコールする
当プロジェクトでは起動、停止それぞれのイベントを作成する。

```
# 起動: 平日08:00 JST
停止: 平日20:00 JST
```

## lambda

タグ「state-scheduler: True」が付与されているRDSに対しイベントにより以下の処理を行う

```
イベントが「StartScheduledRule」の時、起動
イベントが「StopScheduledRule」の時、停止
```

# ディレクトリ構成

```
├── README.md
├── script
│   ├── create_cloud_formatio.sh
│   └── templates_sync_S3.sh
└── templates
    └── RDS_state_scheduler.yaml
```

## script

### create_cloud_formatio.sh

S3上のCloudFormationテンプレートを元に、AWS CloudFormationを作成します。
予め、指定したS3バケットに対象のCloudFormationテンプレートを配置しておく必要があります。

### templates_sync_S3.sh

シェルの中で指定したS3上のパスとtemplatesディレクトリを同期します。

```
$ ./script/sync.sh # dryrun
$ ./script/sync.sh -y # 同期実行
```

## templates

### RDS_state_scheduler.yaml

CloudFormationテンプレート
