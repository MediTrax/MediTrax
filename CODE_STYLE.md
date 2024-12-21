# 代码规范文档

## 官方代码规范参考

### Flutter/Dart
- [Effective Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- [Flutter Style Guide](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo)
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart)
- [Flutter Best Practices](https://docs.flutter.dev/reference/design-principles)

### Golang
- [Effective Go](https://golang.org/doc/effective_go)
- [Go Code Review Comments](https://github.com/golang/go/wiki/CodeReviewComments)
- [Uber Go Style Guide](https://github.com/uber-go/guide/blob/master/style.md)
- [GraphQL-Go Best Practices](https://gqlgen.com/reference/best-practices/)

## 1. 目录结构规范

```
project/
├── client/                # Flutter客户端
│   ├── lib/
│   │   ├── models/       # 数据模型
│   │   ├── screens/      # 页面
│   │   ├── widgets/      # 可复用组件
│   │   ├── services/     # 服务层(API调用、本地存储等)
│   │   ├── utils/        # 工具类
│   │   └── main.dart     # 入口文件
│   └── test/             # 测试文件
│
└── server/               # Go后端
    ├── graph/           # GraphQL相关
    │   ├── model/      # 数据模型
    │   ├── resolver/   # 解析器
    │   └── schema/     # Schema定义
    ├── internal/       # 内部包
    └── cmd/           # 程序入口
```

## 2. Flutter代码规范

### 2.1 命名规范

```dart
// 文件名使用小写下划线
medical_record_screen.dart
user_service.dart

// 类名使用大驼峰
class MedicalRecordScreen extends StatelessWidget {}
class UserService {}

// 变量和方法使用小驼峰
final userProfile;
void getUserProfile() {}

// 私有变量和方法前加下划线
final _userService;
void _handleSubmit() {}

// 常量使用大写下划线
const MAX_RETRY_COUNT = 3;
```

### 2.2 代码组织

```dart
class UserScreen extends StatefulWidget {
  // 1. 静态变量和常量
  static const routeName = '/user';
  
  // 2. 构造函数
  const UserScreen({Key? key}) : super(key: key);
  
  // 3. createState
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  // 1. 变量声明
  final _userService = UserService();
  
  // 2. 生命周期方法
  @override
  void initState() {}
  
  // 3. 私有方法
  void _handleSubmit() {}
  
  // 4. build方法
  @override
  Widget build(BuildContext context) {}
}
```

### 2.3 异步处理

```dart
// 使用async/await而非then
Future<void> getUserData() async {
  try {
    final data = await userService.fetchData();
    // 处理数据
  } catch (e) {
    // 错误处理
  }
}

// 避免在build方法中直接使用异步操作
// 推荐使用FutureBuilder或StreamBuilder
FutureBuilder<UserData>(
  future: getUserData(),
  builder: (context, snapshot) {
    if (snapshot.hasError) return ErrorWidget();
    if (!snapshot.hasData) return LoadingWidget();
    return UserWidget(data: snapshot.data!);
  },
)
```

## 3. Go后端规范

### 3.1 GraphQL Schema定义
```graphql
# 使用清晰的类型名称
type User {
  id: ID!
  name: String!
  email: String!
  createdAt: Time!
  updatedAt: Time!
}

# 使用描述性的字段名
type Query {
  # 获取用户信息
  user(id: ID!): User!
  # 搜索用户列表
  searchUsers(query: String!, limit: Int = 10): [User!]!
}
```

### 3.2 Resolver实现

```go
// resolver/user.resolvers.go

// 使用清晰的包名
package resolver

// 结构体名称要有描述性
type userResolver struct {
    *Resolver
}

// 方法名要清晰表达意图
func (r *queryResolver) User(ctx context.Context, id string) (*model.User, error) {
    // 实现逻辑
}

// 使用统一的错误处理
func (r *mutationResolver) CreateUser(ctx context.Context, input model.CreateUserInput) (*model.User, error) {
    if err := validateUserInput(input); err != nil {
        return nil, fmt.Errorf("invalid input: %w", err)
    }
    // 实现逻辑
}
```

## 4. 测试规范

### 4.1 Flutter测试

```dart
// user_service_test.dart
void main() {
  group('UserService', () {
    late UserService userService;
    
    setUp(() {
      userService = UserService();
    });
    
    test('fetchUser returns user data', () async {
      final user = await userService.fetchUser('123');
      expect(user.id, equals('123'));
    });
    
    test('fetchUser throws exception for invalid id', () {
      expect(
        () => userService.fetchUser('invalid'),
        throwsException,
      );
    });
  });
}
```

### 4.2 Go测试

```go
// user_test.go
func TestUserResolver(t *testing.T) {
    // 使用表驱动测试
    tests := []struct {
        name    string
        userID  string
        want    *model.User
        wantErr bool
    }{
        {
            name:   "valid user",
            userID: "123",
            want:   &model.User{ID: "123"},
        },
        {
            name:    "invalid user",
            userID:  "invalid",
            wantErr: true,
        },
    }
    
    for _, tt := range tests {
        t.Run(tt.name, func(t *testing.T) {
            // 测试实现
        })
    }
}
```

## 5. 错误处理规范

### 5.1 Flutter错误处理

```dart
// 定义统一的错误类型
abstract class AppError extends Error {
  final String message;
  AppError(this.message);
}

class NetworkError extends AppError {
  NetworkError(String message) : super(message);
}

// 统一的错误处理
Future<T> handleError<T>(Future<T> Function() action) async {
  try {
    return await action();
  } on NetworkError catch (e) {
    // 处理网络错误
    rethrow;
  } catch (e) {
    // 处理其他错误
    throw AppError('未知错误');
  }
}
```

### 5.2 Go错误处理

```go
// 定义错误类型
type ErrorCode string

const (
    ErrNotFound   ErrorCode = "NOT_FOUND"
    ErrInvalid    ErrorCode = "INVALID_INPUT"
    ErrPermission ErrorCode = "PERMISSION_DENIED"
)

type AppError struct {
    Code    ErrorCode
    Message string
}

func (e *AppError) Error() string {
    return e.Message
}

// 错误处理示例
func (r *queryResolver) User(ctx context.Context, id string) (*model.User, error) {
    user, err := r.userService.FindByID(id)
    if err != nil {
        return nil, &AppError{
            Code:    ErrNotFound,
            Message: fmt.Sprintf("user not found: %s", id),
        }
    }
    return user, nil
}
```

## 6. 版本控制规范

### 6.1 Git提交信息

```
feat: 添加用户认证功能
^--^  ^-------------------^
|     |
|     +-> 提交描述
|
+-------> 提交类型: feat, fix, docs, style, refactor, test, chore
```

提交类型:
- feat: 新功能
- fix: 修复bug
- docs: 文档更新
- refactor: 代码重构
- test: 测试相关
- chore: 构建/工具相关

### 6.2 分支管理
- main: 主分支
- develop: 开发分支
- feature/*: 功能分支
- hotfix/*: 紧急修复
- release/*: 发布分支

## 7. 文档规范

### 7.1 代码注释

```dart
/// 用户服务类
/// 处理所有与用户相关的API请求
class UserService {
  /// 获取用户信息
  /// 
  /// [userId] 用户ID
  /// 
  /// 如果用户不存在则抛出[UserNotFoundException]
  Future<User> getUser(String userId) async {}
}
```

```go
// UserResolver 处理用户相关的GraphQL查询
type UserResolver struct {
    userService *service.UserService
}

// FindByID 根据ID查找用户
// 如果用户不存在返回NotFoundError
func (r *UserResolver) FindByID(id string) (*model.User, error) {}
```

这份规范文档应该根据团队实际情况进行调整。建议:
1. 定期进行代码评审确保规范执行
2. 使用自动化工具(如linter)辅助规范执行
3. 根据项目发展持续更新规范文档
