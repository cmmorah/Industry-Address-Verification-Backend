create table NAV_ACTIONS
(
    actionId int identity
        constraint NAV_ACTIONS_pk
            primary key nonclustered,
    action   varchar(10)
)
go

create unique index NAV_ACTIONS_actionId_uindex
    on NAV_ACTIONS (actionId)
go

create table NAV_ADDRESS
(
    addressId             int identity (100, 1)
        primary key,
    addressOrganisationId int,
    addressBvn            varchar(20),
    addressDateRequested  datetime default getdate(),
    addressFirstName      varchar(100),
    addressLastName       varchar(100),
    addressMiddleName     varchar(100),
    addressFlatNumber     int,
    addressHouseNumber    int,
    addressLandmark       varchar(100),
    addressLga            varchar(100),
    addressNearestBusstop varchar(100),
    addressNickname       varchar(100),
    addressState          varchar(100),
    addressStreet         varchar(100),
    addressCity           varchar(100),
    addressAddressType    varchar(100),
    addressBusinessName   varchar(100),
    addressBusinessType   varchar(100),
    addressRegNo          varchar(100),
    addressGender         varchar(100),
    addressStatus         varchar(100),
    addressCreatedAt      datetime default getdate() not null,
    addressUpdatedAt      datetime default getdate() not null,
    addressEmail          varchar(100),
    addressMobileNumber   varchar(20),
    addressUserId         int,
    addressCreatedBy      varchar(100),
    addressUpdatedBy      varchar(100)
)
go

create table NAV_AUDIT
(
    auditId              int identity (100, 1)
        constraint PK_NAV_AUDI_43D173997ECAD640
            primary key,
    auditUserId          varchar(100),
    auditAddressId       int,
    auditOrganisationId  int,
    auditItemId          int,
    auditAction          varchar(200),
    auditStatus          varchar(100)
        constraint DF_NAV_AUDITaudit_18178C8A default 'ACTIVE',
    auditCreatedAt       datetime2
        constraint DF_NAV_AUDITaudit_5832119F default getdate(),
    auditUpdatedAt       datetime2
        constraint DF_NAV_AUDITaudit_592635D8 default getdate() not null,
    auditAppVersion      varchar(20),
    auditDeviceId        varchar(20),
    auditDeviceName      varchar(50),
    auditDevicePlatform  varchar(20),
    auditIpAddress       varchar(20),
    auditLatitude        varchar(20),
    auditLongitude       varchar(20),
    auditProfileStatus   varchar(20),
    auditSource          varchar(20),
    auditResponseCode    varchar(3),
    auditResponseMessage varchar(200),
    auditModule          varchar(200),
    auditResponse        varchar(2000),
    auditRequest         varchar(2000),
    auditUserEmail       varchar(100)
)
go

create table NAV_BILLING
(
    billingId               int identity (100, 1)
        primary key,
    billingFeeId            int,
    billingAddressId        int not null,
    billingAgentId          int not null,
    billingValidatingBankId int,
    billingNarration        varchar(100),
    billingTransactionDate  datetime default getdate(),
    billingStatus           varchar(100),
    billingCreatedAt        datetime default getdate(),
    billingUpdatedAt        datetime default getdate(),
    billingTransactionId    varchar(20),
    billingAgencyId         int,
    billingVerifyingBankId  int
)
go

create table NAV_FAILED_REASON
(
    failedReasonId        int identity (100, 1)
        constraint PK_NAV_FAILEDREASON
            primary key,
    failedReasonContent   varchar(50) not null,
    failedReasonIsFlagged bit,
    failedReasonStatus    varchar(50) not null,
    failedReasonCreatedAt datetime    not null,
    failedReasonUpdatedAt datetime    not null
)
go

create table NAV_FEE
(
    feeId          int identity (100, 1)
        primary key,
    feeAmount      float        not null,
    feeDate        varchar(100),
    feeType        varchar(100) not null,
    feeBankRatio   float,
    feeNibssRatio  float        not null,
    feeQucoonRatio float        not null,
    feeStatus      varchar(100) not null,
    feeCreatedAt   datetime     not null,
    feeUpdatedAt   datetime     not null,
    feeAgencyRatio float
)
go

create table NAV_LOCAL_GOVERNMENT
(
    localGovernmentId        int,
    localGovernmentName      varchar(100),
    localGovernmentStateCode varchar(10),
    id                       int identity
        primary key
)
go

create table NAV_MODULE
(
    moduleId        int identity (100, 1)
        primary key,
    moduleName      varchar(100) not null,
    moduleMaker     varchar(100) not null,
    moduleChecker   varchar(100) not null,
    moduleStatus    varchar(100) not null,
    moduleCreatedAt datetime     not null,
    moduleUpdatedAt datetime     not null
)
go

create table NAV_ORGANISATION
(
    organisationId             int identity (100, 1)
        primary key,
    organisationCode           varchar(100),
    organisationEmail          varchar(100),
    organisationMobileNumber   varchar(100),
    organisationLga            varchar(100),
    organisationState          varchar(100),
    organisationAccountName    varchar(100),
    organisationAccountBank    varchar(100),
    organisationAccountNumber  varchar(100),
    organisationRoutingNumber  varchar(100),
    organisationType           varchar(100),
    organisationStatus         varchar(100) default 'ACTIVE',
    organisationCreatedAt      datetime     default getdate() not null,
    organisationUpdatedAt      datetime     default getdate() not null,
    organisationName           varchar(100),
    organisationParentId       int,
    organisationParentIsActive bit
)
go

create table NAV_BRANCH
(
    branchId             int identity (100, 1)
        primary key,
    branchOrganisationId int          not null
        references NAV_ORGANISATION,
    branchName           varchar(100),
    branchCode           int          not null,
    branchStatus         varchar(100) not null,
    branchCreatedAt      datetime     not null,
    branchUpdatedAt      datetime     not null
)
go

create table NAV_ORGANISATION_ADMIN
(
    organisationAdminId               int identity
        primary key,
    organisationName                  varchar(100),
    organisationCode                  varchar(100),
    organisationEmail                 varchar(100),
    organisationMobileNumber          varchar(20),
    organisationLga                   varchar(100),
    organisationState                 varchar(100),
    organisationAccountName           varchar(100),
    organisationAccountBank           varchar(100),
    organisationAccountNumber         varchar(100),
    organisationRoutingNumber         varchar(100),
    organisationType                  varchar(100),
    organisationParentId              varchar(100),
    userRoleId                        int,
    userFirstName                     varchar(100),
    userMiddleName                    varchar(100),
    userLastName                      varchar(100),
    userEmail                         varchar(100),
    userMobileNumber                  varchar(100),
    userPassword                      varchar(100),
    userType                          varchar(100),
    userMaker                         varchar(100),
    userChecker                       varchar(100),
    organisationAdminProcessingStatus varchar(20) default 'PENDING'
)
go

create table NAV_PRIVILEGE
(
    userPrivilegeId         int identity (100, 1)
        primary key,
    userPrivilegeModuleName varchar(100)               not null,
    userPrivilegeModuleId   int                        not null
        references NAV_MODULE,
    userPrivilegeType       varchar(100)               not null,
    userPrivilegeMaker      varchar(100)               not null,
    userPrivilegeChecker    varchar(100)               not null,
    userPrivilegeMode       varchar(100)               not null,
    userPrivilegeStatus     varchar(100)               not null,
    userPrivilegeCreatedAt  datetime default getdate() not null,
    userPrivilegeUpdatedAt  datetime default getdate() not null
)
go

create table NAV_PWB_REPORT
(
    pwbReportId             int identity (100, 1)
        primary key,
    pwbReportName           varchar(100) not null,
    pwbReportDescription    varchar(100) not null,
    pwbReportOwner          varchar(100) not null,
    pwbReportOrganisationId int          not null
        references NAV_ORGANISATION,
    pwbReportType           varchar(100) not null,
    pwbReportCategory       varchar(100) not null,
    pwbReportStatus         varchar(100) not null,
    pwbReportChecker        varchar(100) not null,
    pwbReportCreatedAt      datetime     not null,
    pwbReportUpdatedAt      datetime     not null
)
go

create table NAV_ROLE
(
    roleId               int identity (100, 1)
        primary key,
    roleOrganisationId   int,
    roleName             varchar(100)                not null,
    roleOrganisationType varchar(100)                not null,
    roleStatus           varchar(100)                not null,
    roleCreatedAt        datetime2 default getdate() not null,
    roleUpdatedAt        datetime2 default getdate() not null,
    roleIsDefault        bit       default 0
)
go

create table NAV_ROLE_PRIVILEGE
(
    userRolePrivilegeId             int identity (100, 1)
        constraint PK_NAV_USER_B798981B4168FBBF
            primary key,
    userRolePrivilegeRoleId         int                                                  not null,
    userRolePrivilegeMaker          varchar(100) default 'SYSTEM'                        not null,
    userRolePrivilegeChecker        varchar(100) default 'SYSTEM'                        not null,
    userRolePrivilegeOrganisationId int,
    userRolePrivilegeStatus         varchar(100) default 'ACTIVE'                        not null,
    userRolePrivilegeCreatedAt      datetime
        constraint DF_NAV_USERROLEPRIVILEGE_userRolePrivilegeCreatedAt default getdate() not null,
    userRolePrivilegeUpdatedAt      datetime
        constraint DF_NAV_USERROLEPRIVILEGE_userRolePrivilegeUpdatedAt default getdate() not null,
    userRolePrivilegePrivilegeId    int
)
go

create table NAV_STATE
(
    id           int identity
        primary key,
    stateId      int,
    stateName    varchar(100),
    stateCapital varchar(100),
    stateCode    varchar(10)
)
go

create table NAV_SYSTEM_CONFIG
(
    systemConfigId              int identity (100, 1)
        primary key,
    systemConfigAccountNumber   int                        not null,
    systemConfigEmail           varchar(100)               not null,
    systemConfigProductSortCode int                        not null,
    systemConfigReportFrequency varchar(100)               not null,
    systemConfigSla             varchar(100)               not null,
    systemConfigStatus          varchar(100)               not null,
    systemConfigCreatedAt       datetime default getdate() not null,
    systemConfigUpdatedAt       datetime default getdate() not null
)
go

create table NAV_USER
(
    userId                   int identity (100, 1)
        primary key,
    userRoleId               int,
    userOrganisationId       int,
    userFirstName            varchar(100),
    userMiddleName           varchar(100),
    userLastName             varchar(100),
    userEmail                varchar(100),
    userMobileNumber         varchar(100),
    userPassword             varchar(100),
    userType                 varchar(100),
    userMaker                varchar(100),
    userChecker              varchar(100),
    userLastLogin            varchar(50),
    userStatus               varchar(100) default 'ACTIVE',
    userCreatedAt            datetime     default getdate() not null,
    userUpdatedAt            datetime     default getdate() not null,
    userOtp                  varchar(100),
    userOtpUpdatedAt         datetime,
    userState                varchar(100),
    userLga                  varchar(100),
    userIsOrganisationActive bit,
    userOrganisationParentId int
)
go

create table NAV_USER_ROLE
(
    userRoleId               int identity (100, 1)
        primary key,
    userRoleUserId           int                         not null
        references NAV_USER,
    userRoleRoleId           int                         not null
        references NAV_ROLE,
    userRoleName             varchar(100)                not null,
    userRoleMaker            varchar(100),
    userRoleChecker          varchar(100),
    userRoleOrganisationCode varchar(100),
    userRoleStatus           varchar(100)                not null,
    userRoleCreatedAt        datetime2 default getdate() not null,
    userRoleUpdatedAt        datetime2 default getdate() not null
)
go

create table NAV_VERIFICATION
(
    verificationId           int identity (100, 1)
        primary key,
    verificationAgencyId     int,
    verificationAddressId    int                           not null,
    verificationAgentId      int,
    verificationHouseColor   varchar(40),
    verificationImage        varchar(50),
    verificationCoordinates  varchar(100),
    verificationComment      varchar(100),
    verificationFailedReason varchar(100),
    verificationStatus       varchar(50) default 'PENDING',
    verificationCreatedAt    datetime    default getdate() not null,
    verificationUpdatedAt    datetime    default getdate() not null,
    verificationBankId       int,
    verificationBranchId     int,
    verificationRemark       varchar(20)
)
go

create table PWB_REPORTS
(
    reportId          int identity
        constraint PWB_REPORTS_pk
            primary key nonclustered,
    reportName        varchar(max),
    reportDescription varchar(max),
    reportOwner       varchar(max),
    reportOrgId       varchar(max),
    reportType        varchar(max),
    reportCategory    varchar(max),
    reportStatus      varchar(max) default 'ACTIVE'  not null,
    reportCreatedAt   datetime     default getdate() not null,
    reportUpdatedAt   datetime     default getdate() not null,
    reportChecker     varchar(max)
)
go

create unique index PWB_REPORTS_reportId_uindex
    on PWB_REPORTS (reportId)
go