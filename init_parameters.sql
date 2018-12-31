CREATE TABLE "KBDBA"."model" (
  "modelId" integer not null,
  "xhdm" char(8) not null,
  "xhmc" varchar(32) not null,
  PRIMARY KEY ("modelId")
)
TABLESPACE PARAMETERS
;

CREATE INDEX "KBDBA"."model_xhdm"
  ON "KBDBA"."model" ("xhdm");


  -- fashej 发射机(设备代码，发射机名称，状态批次代码，位置，工作频率，上边频,下边频，频率点数,频率上限，频率下限，发射带宽，基频功率，调制类型，本振频率，中频，备注)
  CREATE TABLE "KBDBA"."fashej" (
      "fashejId" integer not null,
      "sbdm" char(16) not null,
      "sbmc" varchar(32) not null,
      "pcdm" char(32)  not null,
      "location" varchar(32) not null,
      "freq" number(16,4) not null,
      "pd_upper" number(16,4) not null,
      "pd_lower" number(16,4) not null,
      "num" integer not null,
      "freq_upper" number(16,4) ,
      "freq_lower" number(16,4) ,
      "bw" number not null,
      "base_power" number(16,4) not null,
      "tzlx" char(16) not null,
      "bzf" number(16,4) not null,
      "mid_freq" number(16,4) not null,
      "comment1" varchar(32),
      PRIMARY KEY ("fashejId")
  ) TABLESPACE PARAMETERS;

  CREATE INDEX "KBDBA"."fashej_sbdm"
    ON "KBDBA"."fashej" ("sbdm");

    -- fashetx 发射天线(丛属设备代码，发射天线名称，状态批次代码，位置，增益，极化，方位波速带宽，俯仰波速带宽，天线指向角)
    CREATE TABLE "KBDBA"."fashetx" (
        "fashetxId" integer not null,
        "cssbdm" char(16) not null,
        "cssbmc" varchar(32) not null,
        "pcdm" char(32) not null,
        "location" varchar(32) not null,
        "gain" number(16,4) not null,
        "polarization" char(16) not null,
        "fwbskd" number(16,4) not null,
        "fybskd" number(16,4) not null,
        "txzxj" number(16,4) not null,
        PRIMARY KEY ("fashetxId")
    ) TABLESPACE PARAMETERS;

    CREATE INDEX "KBDBA"."fashetx_cssbdm"
      ON "KBDBA"."fashetx" ("cssbdm");

    -- jieshouj 接收机(设备代码，接收机名称，状态批次代码,位置，频段上限，频段下限，工作频率，上边频,下边频,接收机带宽，接收机灵敏度，中频符号，中频频率，本振频率)
    CREATE TABLE "KBDBA"."jieshouj" (
        "jieshoujId" integer not null,
        "sbdm" char(16) not null,
        "sbmc" varchar(32) not null,
        "pcdm" char(32) not null,
        "location" varchar(32) not null,
        "fb_upper" number(16,4) not null,
        "fb_lower" number(16,4) not null,
        "freq" number(16,4),
        "f_upper" number(16,4),
        "f_lower" number(16,4),
        "bw_receiver" number(16,4) not null,
        "sen_receiver" number(16,4) not null,
        "mf_freq_sign" varchar(16) not null,
        "mf_freq" number(16,4) not null,
        "lo_freq" number(16,4) not null,
        PRIMARY KEY ("jieshoujId")
    ) TABLESPACE PARAMETERS;

    CREATE INDEX "KBDBA"."jieshouj_sbdm"
      ON "KBDBA"."jieshouj" ("sbdm");

    -- jieshoutx 接收天线(丛属设备代码，接收天线名称，状态批次代码，位置,增益，极化，方位波束宽度，俯仰波束宽度， 天线指向角)
    CREATE TABLE "KBDBA"."jieshoutx" (
        "jieshoutxId" integer not null,
        "cssbdm" char(16) not null,
        "cssbmc" varchar(32) not null,
        "pcdm" char(32) not null,
        "location" varchar(32) not null,
        "gain" number(16,4) not null,
        "polarization" char(16) not null,
        "fwbskd" number(9,4) not null,
        "fybskd" number(9,4) not null,
        "txzxj" number(9,4) not null,
        PRIMARY KEY ("jieshoutxId")
    ) TABLESPACE PARAMETERS;

    CREATE INDEX "KBDBA"."jieshoutx_cssbdm"
      ON "KBDBA"."jieshoutx" ("cssbdm");

    -- lvboq滤波器(从属设备代码，滤波器名称，状态批次代码，位置，工作频率，上边频，下边频，滤波器级数，滤波器插损)
    CREATE TABLE "KBDBA"."lvboq" (
        "lvboqId" integer not null,
        "cssbdm" char(16) not null,
        "cssbmc" varchar(32) not null,
        "pcdm" char(32) not null,
        "location" varchar(32) not null,
        -- fb_upper number(16,4) not null,
        -- fb_lower number(16,4) not null,
        "freq" number(16,4),
        "f_upper" number(16,4),
        "f_lower" number(16,4),
        "order1" number(16,4) not null,
        "s21" number(16,4) not null,
        PRIMARY KEY ("lvboqId")
    ) TABLESPACE PARAMETERS;

    CREATE INDEX "KBDBA"."lvboq_cssbdm"
      ON "KBDBA"."lvboq" ("cssbdm");

    -- dianxingtxzyzk 典型天线增益子库(天线类型，增益)
    CREATE TABLE "KBDBA"."dianxingtxzyzk" (
        "dianxingtxzyzkId" integer not null,
        "type_antennas" char(30) not null,
        "gain" integer not null,
        PRIMARY KEY ("dianxingtxzyzkId")
    ) TABLESPACE PARAMETERS;

    CREATE INDEX "KBDBA"."dianxingtxzyzk_type_antennas"
      ON "KBDBA"."dianxingtxzyzk" ("type_antennas");

    -- tianxianzk 天线子库(子库代码，子库名)
    CREATE TABLE "KBDBA"."tianxianzk" (
        "tianxianzkId" integer not null,
        "lib_code" char(16) not null,
        "lib_name" varchar(32) not null,
        PRIMARY KEY ("tianxianzkId")
    ) TABLESPACE PARAMETERS;

    CREATE INDEX "KBDBA"."tianxianzk_lib_code"
      ON "KBDBA"."tianxianzk" ("lib_code");

    -- jieshoujzk 接收机子库(子库代码，子库名)
    CREATE TABLE "KBDBA"."jieshoujzk" (
        "jieshoujzkId" integer not null,
        "lib_code" char(16) not null,
        "lib_name" varchar(32) not null,
        PRIMARY KEY ("jieshoujzkId")
    ) TABLESPACE PARAMETERS;

    CREATE INDEX "KBDBA"."jieshoujzk_lib_code"
      ON "KBDBA"."jieshoujzk" ("lib_code");

    -- fashejzk发射机子库(子库代码，子库名)
    CREATE TABLE "KBDBA"."fashejzk" (
        "fashejzkId" integer not null,
        "lib_code" char(16) not null,
        "lib_name" varchar(32) not null,
        PRIMARY KEY ("fashejzkId")
    ) TABLESPACE PARAMETERS;

    CREATE INDEX "KBDBA"."fashejzk_lib_code"
      ON "KBDBA"."fashejzk" ("lib_code");

    -- ceshishysh测试实验室(名称，单位，级别，概况)
    CREATE TABLE "KBDBA"."ceshishysh" (
        "ceshishyshId" integer not null,
        "name" char(32) not null,
        "unit" varchar(32) not null,
        "level1" char(16) not null,
        "survey" varchar(32) not null,
        PRIMARY KEY ("ceshishyshId")
    ) TABLESPACE PARAMETERS;

    CREATE INDEX "KBDBA"."ceshishysh_name"
      ON "KBDBA"."ceshishysh" ("name");

    -- ceshiry测试人员(姓名，性别，年龄，学历，职称，证书编号，单位)
    CREATE TABLE "KBDBA"."ceshiry" (
        "ceshiryId" integer not null,
        "name" char(16) not null,
        "sex" char(2) not null,
        "age" integer not null,
        "edu_level" char(8) not null,
        "post" char(16) not null,
        "certificate_code" char(16) not null,
        "unit" varchar(32) not null,
        PRIMARY KEY ("ceshiryId")
    ) TABLESPACE PARAMETERS;

    CREATE INDEX "KBDBA"."ceshiry_name"
      ON "KBDBA"."ceshiry" ("name","certificate_code");

    -- ceshiff测试方法(方法编号，方法标题，适用范围，仪器设备，测试框图，测试步骤，附注)
    CREATE TABLE "KBDBA"."ceshiff" (
        "ceshiffId" integer not null,
        "m_id" char(16) not null,
        "m_title" char(32) not null,
        "range1" varchar(16) not null,
        "device" varchar(16) not null,
        "diagram" char(16) not null,
        "step" varchar(16) not null,
        "annotation" varchar(32) not null,
        PRIMARY KEY ("ceshiffId")
    ) TABLESPACE PARAMETERS;

    CREATE INDEX "KBDBA"."ceshiff"
      ON "KBDBA"."ceshiff" ("m_id");

    -- ceshibg测试报告(测试证书编号，委托方，委托方地址，被测件，EUT编号，EUT型号，制造商，测试日期，
    -- 测试地点，测试设备，测试设备型号，测试设备编号，测试依据，温度，湿度，测试人员，签发人，审核人，测试结果)
    CREATE TABLE "KBDBA"."ceshibg" (
        "ceshibgId" integer not null,
        "t_id" char(16) not null,
        "bailor" char(32) not null,
        "address" varchar(32) not null,
        "device" varchar(32) not null,
        "eut_id" char(16) not null,
        "eut_type" char(16) not null,
        "manufacturor" varchar(32) not null,
        "t_date"  date not null,
        "t_address" varchar(32) not null,
        "t_device" varchar(32) not null,
        "t_device_type" char(16) not null,
        "t_device_id" char(16) not null,
        "reference" varchar(16) not null,
        "temp" number(3,1) not null,
        "huminitily" number(2,1) not null,
        "t_man" char(10) not null,
        "signer" char(10) not null,
        "assessor" char(10) not null,
        "t_result" varchar(32) not null,
        PRIMARY KEY ("ceshibgId")
    ) TABLESPACE PARAMETERS;

    CREATE INDEX "KBDBA"."ceshibg"
      ON "KBDBA"."ceshibg" ("t_id");

    -- ceshixm 测试项目 （被测件，项目名称，示意图，测试说明，测试仪器，测试数据，测试结果）
    CREATE TABLE "KBDBA"."ceshixm" (
        "ceshixmId" integer not null,
        "project_id" integer not null,
        "device" char(32) not null,
        "name" char(32)  not null,
        "diagram" varchar(32)  not null,
        "t_remark" varchar(16) not null,
        "t_strument" varchar(16) not null,
        "t_value"  varchar(16) not null,
        "t_result" varchar(16) not null,
        PRIMARY KEY ("ceshixmId")
    ) TABLESPACE PARAMETERS;

    CREATE INDEX "KBDBA"."ceshixm"
      ON "KBDBA"."ceshixm" ("project_id");
