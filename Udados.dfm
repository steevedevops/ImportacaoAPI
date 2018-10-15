object Dados: TDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 188
  Width = 427
  object IBDatabase: TIBDatabase
    DatabaseName = '127.0.0.1/3050:D:\GestaoIB\Banco\italia\TABELAS.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction
    ServerType = 'IBServer'
    Left = 26
    Top = 8
  end
  object IBTransaction: TIBTransaction
    DefaultDatabase = IBDatabase
    Left = 98
    Top = 8
  end
  object QryBuscaproduto: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 40
    Top = 74
  end
  object dtsbuscaproduto: TDataSource
    DataSet = QryBuscaproduto
    Left = 40
    Top = 130
  end
  object QrybuscaVariacao: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dtsbuscaproduto
    ParamCheck = True
    SQL.Strings = (
      'select'
      'lp.cod_produto,'
      'lp.codgeral,'
      'lp.codgrupo,'
      'lp.estoque,'
      'lp.preco,'
      'lp.peso,'
      'lp.codlinha as codbanho,'
      'lp.codvar as codtamanho,'
      'lp.situacao'
      'from linhas_produto lp'
      'where lp.cod_produto  = :codigo')
    Left = 136
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object QrybuscaVariacaoCOD_PRODUTO: TIBStringField
      FieldName = 'COD_PRODUTO'
      Origin = '"LINHAS_PRODUTO"."COD_PRODUTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object QrybuscaVariacaoCODGERAL: TIBStringField
      FieldName = 'CODGERAL'
      Origin = '"LINHAS_PRODUTO"."CODGERAL"'
    end
    object QrybuscaVariacaoESTOQUE: TIBBCDField
      FieldName = 'ESTOQUE'
      Origin = '"LINHAS_PRODUTO"."ESTOQUE"'
      Precision = 18
      Size = 2
    end
    object QrybuscaVariacaoPRECO: TIBBCDField
      FieldName = 'PRECO'
      Origin = '"LINHAS_PRODUTO"."PRECO"'
      Precision = 18
      Size = 3
    end
    object QrybuscaVariacaoPESO: TIBBCDField
      FieldName = 'PESO'
      Origin = '"LINHAS_PRODUTO"."PESO"'
      Precision = 18
      Size = 3
    end
    object QrybuscaVariacaoCODBANHO: TIBStringField
      FieldName = 'CODBANHO'
      Origin = '"LINHAS_PRODUTO"."CODLINHA"'
      Size = 10
    end
    object QrybuscaVariacaoCODTAMANHO: TIBStringField
      FieldName = 'CODTAMANHO'
      Origin = '"LINHAS_PRODUTO"."CODVAR"'
      Size = 10
    end
    object QrybuscaVariacaoSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Origin = '"LINHAS_PRODUTO"."SITUACAO"'
      FixedChar = True
      Size = 1
    end
    object QrybuscaVariacaoCODGRUPO: TIBStringField
      FieldName = 'CODGRUPO'
      Origin = '"LINHAS_PRODUTO"."CODGRUPO"'
      Size = 10
    end
  end
  object dtsbuscavariacao: TDataSource
    DataSet = QrybuscaVariacao
    Left = 136
    Top = 128
  end
  object dtHrEnvDadosmacro: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select'
      'dh.dthr_gp_env,'
      'dh.dthr_bn_env,'
      'dh.dthr_tm_env,'
      'dh.dthr_pr_env,'
      'dh.dthr_vr_env'
      'from dthr_env_dadosmacro dh')
    Left = 320
    Top = 8
    object dtHrEnvDadosmacroDTHR_GP_ENV: TDateTimeField
      FieldName = 'DTHR_GP_ENV'
      Origin = '"DTHR_ENV_DADOSMACRO"."DTHR_GP_ENV"'
    end
    object dtHrEnvDadosmacroDTHR_BN_ENV: TDateTimeField
      FieldName = 'DTHR_BN_ENV'
      Origin = '"DTHR_ENV_DADOSMACRO"."DTHR_BN_ENV"'
    end
    object dtHrEnvDadosmacroDTHR_TM_ENV: TDateTimeField
      FieldName = 'DTHR_TM_ENV'
      Origin = '"DTHR_ENV_DADOSMACRO"."DTHR_TM_ENV"'
    end
    object dtHrEnvDadosmacroDTHR_PR_ENV: TDateTimeField
      FieldName = 'DTHR_PR_ENV'
      Origin = '"DTHR_ENV_DADOSMACRO"."DTHR_PR_ENV"'
    end
    object dtHrEnvDadosmacroDTHR_VR_ENV: TDateTimeField
      FieldName = 'DTHR_VR_ENV'
      Origin = '"DTHR_ENV_DADOSMACRO"."DTHR_VR_ENV"'
    end
  end
  object QryBuscaVar: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 216
    Top = 72
  end
  object dtsbuscavar: TDataSource
    DataSet = QryBuscaVar
    Left = 216
    Top = 128
  end
  object QryAtualizaEnv: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dtsbuscaproduto
    ParamCheck = True
    Left = 360
    Top = 88
  end
end