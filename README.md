# 交付文档

## 一、交付产品

本项目包含以下主要组件：

1. 客户端应用 (Flutter)
   1. IOS: https://testflight.apple.com/join/TeakKbgW
   2. Android
   3. Web
2. 服务器端应用 (GraphQL)
3. API文档

数据库登入：
- namespace: meditrax 
- database: meditrax 
- URL: ws://124.222.232.233:8000/rpc

## 二、产品目标

开发一个医疗健康管理系统，主要功能包括：

1. 健康风险评估
2. AI辅助分析
3. 治疗进度追踪
4. 用户档案管理

## 三、开发组织管理

### 1. 过程管理

项目使用以下工具进行开发过程管理：
- GraphDoc用于API文档生成
- LCOV用于代码覆盖率报告

参考代码：

```shell:server/generate_docs.sh
npm install -g @2fd/graphdoc

graphdoc -e http://localhost:8000/graphql -o ./doc/schema
```

### 2. 人员分工

- 前端开发团队：负责Flutter客户端开发
- 后端开发团队：负责GraphQL服务器开发
- 测试团队：负责代码覆盖率测试

### 3. 开发环境

开发工具和框架：
- 前端：Flutter 3.26.0
- 后端：GraphQL Golang 1.20.0
- 文档生成：GraphDoc 2.4.0
- 测试覆盖率：LCOV
- 数据库：Surrealdb 2.1.0

### 4. 配置管理

使用版本控制系统进行代码管理，包含以下主要目录：
- client/：客户端代码
- server/：服务器端代码

## 四、系统设计

### 1. 前端交互

#### 路由设计 (main.dart)

1. 主要导航路由：
```dart:client/lib/main.dart
final navBarRoutes = {
  0: '/treatment',          // 治疗监控
  1: '/medicine-inventory', // 药品库存
  2: '/',                  // 主页
  3: '/medical-records',   // 医疗记录
  4: '/profile',           // 个人档案
};
```

2. 功能路由：
- `/auth` - 认证页面
- `/splash` - 启动页面
- `/` - 主页
- `/treatment` - 治疗监控
- `/medicine-inventory` - 药品库存
- `/medical-records` - 医疗记录
- `/profile` - 个人档案
- `/ai-helper` - AI助手
- `/diet-management` - 饮食管理
- `/profile-sharing` - 档案共享
- `/health-risk-assessment` - 健康风险评估
- `/health-risk-report` - 健康风险报告
- `/prescription-management` - 处方管理
- `/rewards` - 奖励系统

#### 界面功能说明

1. 基础界面：
- `AuthScreen` - 用户登录和注册界面
- `SplashScreen` - 应用启动加载界面
- `HomeScreen` - 主页面，展示主要功能入口
- `ProfileScreen` - 用户档案管理界面

2. 健康管理界面：
- `HealthRiskEntryScreen` - 健康风险信息录入界面
- `HealthRiskReportScreen` - 健康风险评估报告展示
- `MedicalRecordsScreen` - 医疗记录管理界面
- `TreatmentMonitoringScreen` - 治疗进度监控界面

3. 药物管理界面：
- `MedicineInventoryScreen` - 药品库存管理界面
- `PrescriptionManagementScreen` - 处方管理界面

4. 智能辅助界面：
- `AiHelperScreen` - AI辅助分析和建议界面
- `DietManagementScreen` - 饮食计划管理界面

5. 社交功能界面：
- `ProfileSharingScreen` - 档案共享和家庭协作界面
- `RewardsScreen` - 用户成就和奖励系统界面

### 2. 后端模块

1. GraphQL Schema 定义：
- Query类型：定义查询接口
- Mutation类型：定义修改接口
- 自定义类型：如HealthRiskAssessment、QuestionnaireObject等

2. Resolvers实现：
- Query解析器：处理数据查询
- Mutation解析器：处理数据修改
- 类型解析器：处理自定义类型字段解析

### 3. 接口规范

GraphQL API主要包含：

1. 用户认证接口：

**Query**

| 接口名称 | 输入参数 | 返回类型 | 说明 |
|---------|----------|----------|------|
| getUser | - | UserDetailResponse | 获取当前用户信息 |
| getProfiles | - | [ProfileDetail] | 获取用户档案列表 |
| getSharedProfiles | - | [ProfileDetail] | 获取共享档案列表 |

**Mutation**

| 接口名称 | 输入参数 | 返回类型 | 说明 |
|---------|----------|----------|------|
| createUser | phoneNumber: String!, password: String!, username: String!, role: String! | CreateUserResponse | 创建新用户 |
| loginUser | phoneNumber: String!, password: String! | LoginUserResponse | 用户登录 |
| updateUser | name: String, phoneNumber: String, password: String | UpdateUserResponse | 更新用户信息 |
| deleteUser | - | DeleteUserResponse | 删除用户 |
| refreshToken | accessToken: String!, refreshToken: String!, device: String! | Token | 刷新认证令牌 |
| requestPasswordReset | phoneNumber: String! | RequestPasswordResetResponse | 请求密码重置 |
| resetPassword | resetCode: String!, newPassword: String! | ResetPasswordResponse | 重置密码 |
| shareProfile | phoneNumber: String!, accessLevel: String!, remarks: String! | ShareProfileResponse | 共享用户档案 |
| unshareProfile | targetUserId: String! | UnshareProfileResponse | 取消档案共享 |

2. 健康管理接口：

**Query**

| 接口名称 | 输入参数 | 返回类型 | 说明 |
|---------|----------|----------|------|
| getHealthRiskAssessment | - | [HealthRiskAssessmentDetailResponse] | 获取健康风险评估历史 |
| getHealthRiskAssessmentQuestion | - | QuestionnaireObject | 获取风险评估问卷 |
| getHealthMetrics | startDate: DateTime, endDate: DateTime, metricType: String | [HealthMetricDetail] | 获取健康指标数据 |
| getMedicalRecords | - | [MedicalRecordDetail] | 获取医疗记录 |

**Mutation**

| 接口名称 | 输入参数 | 返回类型 | 说明 |
|---------|----------|----------|------|
| evaluateHealthRiskAssessment | filledQuestionnaire: FilledQuestionnaire! | EvaluateHealthRiskAssessmentResponse | 提交并评估健康风险 |
| addHealthMetric | metricType: String!, value: Float!, unit: String!, recordedAt: DateTime! | AddHealthMetricResponse | 添加健康指标 |
| updateHealthMetric | metricId: String!, value: Float, unit: String, recordedAt: DateTime | UpdateHealthMetricResponse | 更新健康指标 |
| deleteHealthMetric | metricId: String! | DeleteHealthMetricResponse | 删除健康指标 |
| addMedicalRecord | recordType: String!, content: String! | AddMedicalRecordResponse | 添加医疗记录 |
| updateMedicalRecord | recordId: String!, recordType: String, content: String | UpdateMedicalRecordResponse | 更新医疗记录 |
| deleteMedicalRecord | recordId: String! | DeleteMedicalRecordResponse | 删除医疗记录 |

3. 药物管理接口：

**Query**

| 接口名称 | 输入参数 | 返回类型 | 说明 |
|---------|----------|----------|------|
| getMedications | - | [MedicationDetail] | 获取药物列表 |
| getMedicationReminders | - | [MedicationReminderDetail] | 获取服药提醒 |
| getTreatmentSchedules | - | [TreatmentScheduleDetail] | 获取治疗计划 |

**Mutation**

| 接口名称 | 输入参数 | 返回类型 | 说明 |
|---------|----------|----------|------|
| addMedication | name: String!, dosage: Float!, unit: String!, frequency: String!, inventory: Float! | AddMedicationResponse | 添加药物 |
| updateMedication | medicationId: String!, name: String, dosage: Float, unit: String, frequency: String, inventory: Float | UpdateMedicationResponse | 更新药物信息 |
| deleteMedication | medicationId: String! | DeleteMedicationResponse | 删除药物 |
| createMedicationReminder | medicationId: String!, reminderTime: DateTime! | CreateMedicationReminderResponse | 创建服药提醒 |
| updateMedicationReminder | reminderId: String!, reminderTime: DateTime, isTaken: Boolean | UpdateMedicationReminderResponse | 更新服药提醒 |
| deleteMedicationReminder | reminderId: String! | DeleteMedicationReminderResponse | 删除服药提醒 |
| takeMedication | reminderId: String | TakeMedicationResponse | 记录服药 |
| createTreatmentSchedule | treatmentType: String!, scheduledTime: DateTime!, location: String!, notes: String | CreateTreatmentScheduleResponse | 创建治疗计划 |
| updateTreatmentSchedule | scheduleId: String!, treatmentType: String, scheduledTime: DateTime, location: String, notes: String | UpdateTreatmentScheduleResponse | 更新治疗计划 |
| deleteTreatmentSchedule | scheduleId: String! | DeleteTreatmentScheduleResponse | 删除治疗计划 |

4. 成就系统接口：

**Query**

| 接口名称 | 输入参数 | 返回类型 | 说明 |
|---------|----------|----------|------|
| getAchievementBadges | - | [AchievementBadgeDetail] | 获取成就徽章列表 |
| getUserAchievements | - | [UserAchievementDetail] | 获取用户成就列表 |
| getUserPointRecords | - | [UserPointRecordDetail] | 获取积分记录 |

**Mutation**

| 接口名称 | 输入参数 | 返回类型 | 说明 |
|---------|----------|----------|------|
| createAchievementBadge | name: String!, description: String!, iconUrl: String! | CreateAchievementBadgeResponse | 创建成就徽章 |
| awardAchievement | badgeId: String! | AwardAchievementResponse | 授予用户成就 |
| earnPoints | pointsEarned: Float!, reason: String! | earnPointsResponse | 记录用户积分 |

5. 数据共享接口：

**Query**

| 接口名称 | 输入参数 | 返回类型 | 说明 |
|---------|----------|----------|------|
| getSharedMedicalRecords | patientId: String! | [MedicalRecordDetail] | 获取共享医疗记录 |
| getSharedTreatmentSchedule | patientId: String! | [TreatmentScheduleDetail] | 获取共享治疗计划 |
| getSharedMedications | patientId: String! | [MedicationDetail] | 获取共享药物信息 |
| getSharedHealthMetrics | patientId: String!, startDate: DateTime, endDate: DateTime, metricType: String | [HealthMetricDetail] | 获取共享健康指标 |

### 4. 数据库设计

主要数据模型包括：

1. 用户相关：

**User：用户基本信息**

| 字段 | 类型 | 说明 |
|------|------|------|
| id | String | 主键，用户唯一标识 |
| phoneNumber | String | 唯一索引，用户手机号 |
| password | String | 加密存储的用户密码 |
| name | String | 用户名称 |
| points | Float | 用户积分 |
| role | String | 用户角色 |
| status | Int | 用户状态 |
| createdAt | DateTime | 创建时间 |
| updatedAt | DateTime | 更新时间 |
| lastLogin | DateTime | 最后登录时间 |

**Token：用户认证令牌**

| 字段 | 类型 | 说明 |
|------|------|------|
| id | String | 主键，令牌唯一标识 |
| user | String | 外键 -> User.id |
| accessToken | String | 访问令牌 |
| refreshToken | String | 刷新令牌 |
| device | String | 设备标识 |
| accessTokenExpiry | DateTime | 访问令牌过期时间 |
| refreshTokenExpiry | DateTime | 刷新令牌过期时间 |
| createdAt | DateTime | 创建时间 |
| updatedAt | DateTime | 更新时间 |

**PasswordChange：密码重置记录**

| 字段 | 类型 | 说明 |
|------|------|------|
| id | String | 主键，重置记录唯一标识 |
| user | String | 外键 -> User.id |
| resetCode | String | 重置码 |
| createdAt | DateTime | 创建时间 |

2. 健康相关：

**HealthRisk：健康风险评估**

| 字段 | 类型 | 说明 |
|------|------|------|
| id | String | 主键，评估记录唯一标识 |
| userId | String | 外键 -> User.id |
| questionnaireData | JSON | 问卷数据 |
| riskLevel | String | 风险等级 |
| recommendations | String | 建议内容 |
| createdAt | DateTime | 创建时间 |

**HealthMetric：健康指标数据**

| 字段 | 类型 | 说明 |
|------|------|------|
| id | String | 主键，指标记录唯一标识 |
| userId | String | 外键 -> User.id |
| metricType | String | 索引，指标类型 |
| value | Float | 指标值 |
| unit | String | 单位 |
| recordedAt | DateTime | 记录时间 |
| createdAt | DateTime | 创建时间 |

**MedicalRecord：医疗记录**

| 字段 | 类型 | 说明 |
|------|------|------|
| id | String | 主键，记录唯一标识 |
| userId | String | 外键 -> User.id |
| recordType | String | 索引，记录类型 |
| content | String | 记录内容 |
| createdAt | DateTime | 创建时间 |
| updatedAt | DateTime | 更新时间 |

3. 治疗相关：

**Medication：药物信息**

| 字段 | 类型 | 说明 |
|------|------|------|
| id | String | 主键，药物唯一标识 |
| userId | String | 外键 -> User.id |
| name | String | 药物名称 |
| dosage | Float | 剂量 |
| unit | String | 单位 |
| frequency | String | 服用频率 |
| inventory | Float | 库存量 |
| createdAt | DateTime | 创建时间 |
| updatedAt | DateTime | 更新时间 |

**MedicationReminder：服药提醒**

| 字段 | 类型 | 说明 |
|------|------|------|
| id | String | 主键，提醒唯一标识 |
| medicationId | String | 外键 -> Medication.id |
| userId | String | 外键 -> User.id |
| reminderTime | DateTime | 索引，提醒时间 |
| isTaken | Boolean | 是否已服用 |
| createdAt | DateTime | 创建时间 |

**TreatmentSchedule：治疗计划**

| 字段 | 类型 | 说明 |
|------|------|------|
| id | String | 主键，计划唯一标识 |
| userId | String | 外键 -> User.id |
| treatmentType | String | 治疗类型 |
| scheduledTime | DateTime | 索引，计划时间 |
| location | String | 治疗地点 |
| notes | String | 备注说明 |

4. 成就系统：

**AchievementBadge：成就徽章**

| 字段 | 类型 | 说明 |
|------|------|------|
| id | String | 主键，徽章唯一标识 |
| name | String | 徽章名称 |
| description | String | 徽章描述 |
| iconUrl | String | 徽章图标URL |
| createdAt | DateTime | 创建时间 |

**UserAchievement：用户成就**

| 字段 | 类型 | 说明 |
|------|------|------|
| id | String | 主键，用户成就唯一标识 |
| userId | String | 外键 -> User.id |
| badgeId | String | 外键 -> AchievementBadge.id |
| earnedAt | DateTime | 获得时间 |
| createdAt | DateTime | 创建时间 |

**UserPointRecord：积分记录**

| 字段 | 类型 | 说明 |
|------|------|------|
| id | String | 主键，积分记录唯一标识 |
| userId | String | 外键 -> User.id |
| pointsEarned | Float | 获得积分数 |
| reason | String | 获得原因 |
| earnedAt | DateTime | 获得时间 |

5. 活动记录：

**ActivityLog：用户活动日志**

| 字段 | 类型 | 说明 |
|------|------|------|
| id | String | 主键，日志唯一标识 |
| userId | String | 外键 -> User.id |
| activityType | String | 索引，活动类型 |
| description | String | 活动描述 |
| changedObject | String | 变更对象 |
| changedField | String | 变更字段 |
| from | String | 变更前值 |
| to | String | 变更后值 |
| timestamp | DateTime | 索引，时间戳 |

数据关系：
1. User 1:N Token (一个用户可以有多个设备的令牌)
2. User 1:N HealthRisk (一个用户可以有多次健康风险评估)
3. User 1:N HealthMetric (一个用户可以有多个健康指标记录)
4. User 1:N MedicalRecord (一个用户可以有多个医疗记录)
5. User 1:N Medication (一个用户可以有多个药物)
6. Medication 1:N MedicationReminder (一个���物可以有多个提醒)
7. User 1:N TreatmentSchedule (一个用户可以有多个治疗计划)
8. User 1:N UserAchievement (一个用户可以获得多个成就)
9. AchievementBadge 1:N UserAchievement (一个成就徽章可以被多个用户获得)
10. User 1:N UserPointRecord (一个用户可以有多条积分记录)
11. User 1:N ActivityLog (一个用户可以有多条活动记录)

## 五、难点、创新点和遇到的问题

1. 多语言支持
2. 实时数据同步
3. AI集成
4. 性能优化

## 六、测试总结

代码覆盖率报告显示：
- lib/models/: 3.7% 覆盖率
- lib/utils/: 0.0% 覆盖率
- lib/services/: 0.0% 覆盖率

需要进一步提高测试覆盖率。

## 七、系统部署

### 1. 部署架构

系统采用Docker容器化部署，主要包含以下服务：
- 客户端服务 (client)：Flutter Web应用
- API服务 (api)：GraphQL服务器
- 数据库服务 (db)：Surrealdb
- 反向代理：Caddy服务器

### 2. 环境配置

1. 容器配置：
```yaml:deploy/docker-compose.yaml
version: '3'
services:
  client:
    container_name: meditrax-client
    restart: unless-stopped
    ports:
      - 8080:80
    expose:
      - 80
    labels:
      caddy: meditrax.wmtech.cc
      caddy.@ws.0_header: Connection *Upgrade*
      caddy.@ws.1_header: Upgrade websocket
      caddy.0_reverse_proxy: "@ws {{upstreams}}"
      caddy.1_reverse_proxy: "{{ upstreams 80 }}"
    image: registry-intl.ap-southeast-1.aliyuncs.com/swmeng/meditrax-client:${BUILD_NUMBER}
  api:
    restart: always
    hostname: meditrax-api
    container_name: meditrax-api
    ports:
      - 8081:80
    image: registry-intl.ap-southeast-1.aliyuncs.com/swmeng/meditrax-server:${BUILD_NUMBER}
    environment:
      - BUILD_NUMBER=${BUILD_NUMBER}
    volumes:
      - "./.env:/.env"
      - "./auth.creds:/auth.creds"
      - "./backend.creds:/backend.creds"
      - ./assets:/assets
```

2. 环境要求：
- Docker 24.0+
- Docker Compose v2
- 阿里云容器镜像服务访问权限

3. 环境变量：
- BUILD_NUMBER：构建版本号
- .env：应用配置文件
- auth.creds：认证凭证
- backend.creds：后端服务凭证

### 3. 部署流程

1. 自动部署脚本：
```shell:deploy/deploy.sh
#!/bin/bash
docker compose pull
docker compose up -d
```

2. 部署步骤：
- 拉取最新镜像
- 启动容器服务
- 配置反向代理
- 验证服务状态

### 4. 运维规范

1. 日常维护：
- 定期检查容器状态
- 监控服务日志
- 备份数据和配置

2. 版本更新：
- 使用CI/CD自动构建新版本
- 通过BUILD_NUMBER控制版本
- 保持配置文件的版本一致性

3. 故障处理：
- 检查容器日志
- 验证网络连接
- 确认环境变量配置
- 检查存储卷挂载状态

### 5. CI/CD 流程

系统使用 GitHub Actions 实现自动化构建和部署，主要流程如下：

1. 工作流配置：
```yaml:.github/workflows/deploy.yaml
name: Build and Deploy

env:
  REGISTRY: registry-intl.ap-southeast-1.aliyuncs.com/swmeng/meditrax-
  DOCKER_BUILDKIT: '1'

on:
  push:
    branches: [ deploy ]
  workflow_dispatch:

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v4
      
      - name: Login to Alibaba Cloud Registry
        uses: docker/login-action@v3
        with:
          registry: registry-intl.ap-southeast-1.aliyuncs.com
          username: ${{ secrets.ALICLOUD_DOCKER_USERNAME }}
          password: ${{ secrets.ALICLOUD_DOCKER_PASSWORD }}
      
      - name: Build Client Image
        uses: docker/build-push-action@v5
        with:
          context: ./client
          push: true
          tags: |
            ${{ env.REGISTRY }}client:latest
            ${{ env.REGISTRY }}client:${{ github.run_number }}
          build-args: |
            ENABLED_MODULES=brotli
            BUILD_NUM=${{ github.run_number }}
      
      - name: Build Server Image
        uses: docker/build-push-action@v5
        with:
          context: ./server
          push: true
          tags: |
            ${{ env.REGISTRY }}server:latest
            ${{ env.REGISTRY }}server:${{ github.run_number }}
```

2. 自动化流程说明：

- 触发条件：
  - 推送到 deploy 分支
  - 手动触发工作流

- 构建阶段：
  - 检出代码
  - 登录阿里云容器镜像服务
  - 构建并推送客户端镜像
  - 构建并推送服务端镜像

- 部署阶段：
  - 通过 SSH 连接到服务器
  - 复制部署配置文件
  - 执行部署脚本
  - 更新容器服务

3. 环境变量和密钥：

- 阿里云镜像仓库：
  - ALICLOUD_DOCKER_USERNAME
  - ALICLOUD_DOCKER_PASSWORD

- 服务器配置：
  - ECS_IP
  - ECS_KEY

4. 版本控制：

- 使用 GitHub run number 作为版本号
- 同时标记 latest 和特定版本
- 保持客户端和服务端版本一致
