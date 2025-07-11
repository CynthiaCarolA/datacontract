-- Data Contract: urn:productoscx.silver.h_eventRegistrationForm_slv-latest
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE productoscx.silver.h_eventRegistrationForm_slv (
  eventRegistrationFormId STRING COMMENT "De tipo string, este campo actúa como identificador único del registro de cada formulario, lo cual es esencial para la trazabilidad y para mantener la integridad de la información almacenada. Al ser una llave técnica, permite que cada registro sea inmutable y único dentro de la base de datos. Ejemplo: 4d3b6696-a8d7-4c01-a527-2950c62f2521. (Llave Técnica)." not null,
  campaignName STRING COMMENT "Un campo string que contiene el nombre descriptivo de la campaña asociada al formulario. Esto facilita la identificación de los registros vinculados a campañas de marketing o investigaciones específicas, lo cual es útil para análisis posteriores. Ejemplo: Campaña Verano OXXO.",
  campaignId STRING COMMENT "Este campo string almacena un identificador único y alfanumérico para cada campaña. Es una llave de negocio que permite agrupar y analizar las respuestas en función de la campaña correspondiente, ayudando a gestionar campañas de forma eficiente. Ejemplo: 03052024_campaña_verano_oxxo. (Llave de Negocio).",
  accountId STRING COMMENT "De tipo string, este campo identifica la cuenta Yape del usuario que completa el formulario. Aunque los formularios no es de uso exclusivo de los “Yaperos”, permite distinguir si el usuario tiene una cuenta en Yape, lo cual facilita segmentar las respuestas por tipo de usuario. Ejemplo: 5cbfce31eef3581dbb2e5a8490d4ac7b.",
  idcCd STRING COMMENT "Field idcCd",
  userId STRING COMMENT "Field userId",
  phoneNum STRING COMMENT "Este campo string contiene el número de teléfono del usuario, lo cual permite el contacto directo y se utiliza como un dato de alta criticidad (DAC) debido a su sensibilidad. Ejemplo: +51931987654. (DAC).",
  userEmailDesc STRING COMMENT "De tipo string, el campo almacena la dirección de correo electrónico del usuario. Esto facilita la comunicación mediante correo y, al igual que otros datos de contacto, es considerado de alta criticidad (DAC). Ejemplo: ejemplo@correo.com. (DAC). Debe estar cifrado",
  givenName STRING COMMENT "Un campo string que guarda el nombre del usuario. Este dato es utilizado para la personalización de las interacciones y, debido a su carácter identificable, es de alta criticidad (DAC). Debe estar cifrado",
  firstFamilyName STRING COMMENT "De tipo string, este campo registra el primer apellido (apellido paterno) del usuario, facilitando su identificación completa y es tratado como dato de alta criticidad (DAC). Ejemplo: Pérez. (DAC). Debe venir cifrado",
  secondFamilyName STRING COMMENT "Campo string que almacena el segundo apellido (apellido materno) del usuario, que en conjunto con el primer apellido permite una identificación completa. Este campo también es considerado de alta criticidad (DAC). Ejemplo: Noriega. (DAC). Debe venir cifrado",
  addressDepartmentCd STRING COMMENT "Un campo integer que guarda el código del departamento al que pertenece el usuario. Este dato es fundamental para segmentaciones geográficas a nivel macro y no es de alta criticidad. Ejemplo: 01.",
  addressProvinceCd STRING COMMENT "De tipo integer, este campo almacena el código de la provincia donde reside el usuario, útil para segmentaciones más precisas en análisis geográficos. Ejemplo: 01.",
  addressDistrictCd STRING COMMENT "Este campo integer contiene el código del distrito del usuario, lo que permite un análisis detallado a nivel distrital, sin embargo, no es de alta criticidad. Ejemplo: 02.",
  referredByName STRING COMMENT "Un campo string que almacena el nombre de la persona que refirió al usuario, permitiendo rastrear la efectividad de referencias en campañas. Considerado de alta criticidad (DAC) por su potencial uso en identificación personal. Ejemplo: María López. (DAC). Debe venir cifrado",
  termAndConditionAgreementFlg STRING COMMENT "Este campo string indica si el usuario aceptó los términos y condiciones del formulario (checkbox), necesario para cumplir con los requisitos legales de consentimiento. ",
  privacyPolicyAgreementFlg STRING COMMENT "De tipo string, muestra si el usuario aceptó las políticas de privacidad del formulario (checkbox), necesario para el cumplimiento de normativas de protección de datos. ",
  favoriteMovieDesc STRING COMMENT "Un campo string que recoge el título de la película favorita del usuario, útil para personalizar campañas y análisis de preferencias.",
  favoriteFoodDesc STRING COMMENT "Este campo string almacena la comida favorita del usuario, lo cual permite segmentar y personalizar comunicaciones basadas en preferencias personales. Ejemplo: Ceviche.",
  businessStruct STRUCT<
      mbBusinessLineTypeCd STRING COMMENT "Este campo  describe el codigo del sector en el cual opera el negocio del usuario, útil para segmentaciones basadas en la industria. Es relevante para analizar tendencias por sector y no se clasifica como dato crítico. Ejemplo: Tecnología.",
      phoneNum STRING COMMENT "De tipo string, contiene el número telefónico del negocio del usuario. Permite el contacto comercial y, debido a su naturaleza de contacto directo, se clasifica como dato de alta criticidad (DAC). Ejemplo: +51931987653. (DAC). Debe venir cifrado ",
      addressDesc STRING COMMENT "Este campo string almacena la dirección física del negocio del usuario, útil para segmentación geográfica y contacto, también considerado de alta criticidad (DAC). Ejemplo: Calle Principal 123, Ciudad. (DAC). Este campo debe venir cifrado",
      tradeName STRING COMMENT "Nombre comercial del negocio tal como fue registrado por el usuario. Este campo representa la denominación bajo la cual el cliente desea ser identificado en los canales digitales o físicos, y puede incluir razón social, nombre de fantasía o marca registrada. Se utiliza para fines de identificación, segmentación y validación en procesos comerciales y operativos.",
      operationChannelTypeDesc STRING COMMENT "Define la naturaleza operativa del negocio. Puede tomar valores como “física”, “digital”, o combinaciones como “mixta”. Este campo permite diferenciar los canales de venta utilizados por el negocio, lo cual es esencial para personalizar servicios, habilitar funcionalidades específicas (como pasarelas de pago o catálogos digitales) y para análisis de estrategia comercial."
    > COMMENT "Contiene  los campos que solo un negocio puee aplicar.",
  skuClassificationArray ARRAY<STRUCT<
      departmentCd STRING COMMENT "Identificador del departamento al que pertenece el SKU. Cada SKU está asociado a una subcategoría de productos; a su vez, cada subcategoría forma parte de una categoría, y todas las categorías se agrupan dentro de departamentos. Este valor no puede estar vacío.",
      departmentDesc STRING COMMENT "Nombre del departamento al que pertenece el SKU. Cada SKU se asocia a una subcategoría, que pertenece a una categoría, y esta a un departamento. Este valor no puede estar vacío.",
      categoryCd STRING COMMENT "Identificador de la categoría a la que pertenece el SKU. Este valor no puede estar vacío.",
      categoryDesc STRING COMMENT "Nombre de la categoría a la que pertenece el SKU. Este valor  no puede estar vacío.",
      subCategoryCd STRING COMMENT "Identificador de la subcategoría a la que pertenece el SKU.",
      subCategoryDesc STRING COMMENT "Nombre que identifica la subcategoría a la que pertenece el SKU.",
      principalflg: STRING COMMENT "Indica si se trata de la categoría principal del SKU."
    >> COMMENT "Array que contiene la estructura del departamento, categoría y subcategoría a la que pertenece el SKU.",
  socialMediaDesc ARRAY<STRING> COMMENT "Contiene uno o varios enlaces a las redes sociales oficiales del negocio (Facebook, Instagram, TikTok, etc.). Este campo permite establecer un canal adicional de verificación, conocer el nivel de digitalización del comercio, y eventualmente enriquecer el perfil digital del cliente para fines de marketing, análisis de reputación o vinculación con plataformas externas.",
  employeeCd STRING COMMENT "Campo que contiende la Matrícula del colaborador ",
  employeeEmailDesc STRING COMMENT "Campo que contiene el Correo del colaborador, este campo es DAC y debe estar cifrado ",
  relationshipWithReferralDesc STRING COMMENT "Campo que contiene el Vinculo con el referido dentro del formulario ",
  recordCreationTs TIMESTAMP COMMENT "Este campo representa la fecha y hora exacta en que se generó la solicitud por parte del usuario, registrada en formato UTC -5 y con el formato yyyy-MM-dd'T'HH:mm
. Este campo es crucial para rastrear el momento específico de cada solicitud, lo que facilita el análisis temporal de incidencias y la gestión cronológica de las notificaciones. Ejemplos de valores posibles incluyen: '2023-12-05 22:43:18' y '2023-12-31 09:01:12'.",
  recordCreationDt DATE COMMENT "Este campo representa la fecha  exacta en que se generó la solicitud por parte del usuario, registrada en formato UTC -5 y con el formato yyyy-MM-dd'T'HH:mm
. Este campo es crucial para rastrear el momento específico de cada solicitud, lo que facilita el análisis temporal de incidencias y la gestión cronológica de las notificaciones. Ejemplos de valores posibles incluyen: '2023-12-05 22:43:18' y '2023-12-31 09:01:12'.",
  executionTs TIMESTAMP COMMENT "Fecha y hora de ejecucion de la rutina de carga al datalake en UTC-0." not null
  ,CONSTRAINT h_eventRegistrationForm_slv_accountId_fk FOREIGN KEY (accountId) REFERENCES core.silver.m_account_slv.accountId
  ,CONSTRAINT h_eventRegistrationForm_slv_userId_fk FOREIGN KEY (userId) REFERENCES core.silver.m_user_slv.userId
)
CLUSTER BY (recordCreationDt, eventRegistrationFormId, campaignName, idcCd)
COMMENT "Esta tabla guarda toda la información de los registros enviados a través del formulario en la web de Yape.
Nivel de detalle:
Esta tabla almacena cada registro enviado por \"id\" del registro, fecha y hora del registro y nombre de la campaña.
Consideraciones:
Esta tabla/evento tiene la finalidad de identificar los registros realizados de los usuarios."
 TBLPROPERTIES (
  'delta.logRetentionDuration' = 'interval 30 days',
  'delta.deletedFileRetentionDuration' = 'interval 30 days',
  'delta.autoOptimize.autoCompact' = 'true',
  'delta.autoOptimize.optimizeWrite' = 'true'
);
ALTER TABLE productoscx.silver.h_eventRegistrationForm_slv SET TAGS ('TypeTable'='historical');
ALTER TABLE productoscx.silver.h_eventRegistrationForm_slv ALTER COLUMN idcCd SET TAGS ('dac');
ALTER TABLE productoscx.silver.h_eventRegistrationForm_slv ALTER COLUMN phoneNum SET TAGS ('dac');
ALTER TABLE productoscx.silver.h_eventRegistrationForm_slv ALTER COLUMN userEmailDesc SET TAGS ('dac');
ALTER TABLE productoscx.silver.h_eventRegistrationForm_slv ALTER COLUMN givenName SET TAGS ('dac');
ALTER TABLE productoscx.silver.h_eventRegistrationForm_slv ALTER COLUMN firstFamilyName SET TAGS ('dac');
ALTER TABLE productoscx.silver.h_eventRegistrationForm_slv ALTER COLUMN secondFamilyName SET TAGS ('dac');
ALTER TABLE productoscx.silver.h_eventRegistrationForm_slv ALTER COLUMN referredByName SET TAGS ('dac');
ALTER TABLE productoscx.silver.h_eventRegistrationForm_slv ALTER COLUMN socialMediaDesc SET TAGS ('dac');
ALTER TABLE productoscx.silver.h_eventRegistrationForm_slv ALTER COLUMN employeeCd SET TAGS ('dac');
ALTER TABLE productoscx.silver.h_eventRegistrationForm_slv ALTER COLUMN employeeEmailDesc SET TAGS ('dac');
