import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meditrax/models/user.dart';
import 'package:meditrax/providers/app_state.dart';
import 'package:meditrax/providers/user.graphql.dart';
import 'package:meditrax/providers/user_provider.dart';
import 'package:meditrax/utils/error_handler.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('个人资料'),
      ),
      body: userAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('加载失败: $error'),
              ElevatedButton(
                onPressed: () => ref.refresh(userDataProvider),
                child: const Text('重试'),
              ),
            ],
          ),
        ),
        data: (user) => user == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_off_outlined,
                      size: 64,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '未登录',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileHeader(context, user),
                      const SizedBox(height: 16),
                      _buildAccountSettings(context, ref),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, User user) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.shade50,
                    border: Border.all(color: Colors.blue.shade100),
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    child: Text(
                      user.name.characters.first,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              user.name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit_rounded),
                            onPressed: () =>
                                _showEditNameDialog(context, ref, user.name),
                            iconSize: 20,
                            style: IconButton.styleFrom(
                              padding: const EdgeInsets.all(4),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.phone_rounded,
                              size: 16,
                              color: Colors.grey.shade700,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              user.phoneNumber,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (user.role == 'VIP')
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.amber.shade200),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star_rounded,
                          size: 16,
                          color: Colors.amber.shade700,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'VIP',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const Divider(height: 32),

            // Profile Switcher Section
            Consumer(
              builder: (context, ref, child) {
                final profilesFuture =
                    ref.watch(userDataProvider.notifier).getProfiles();
                return FutureBuilder(
                  future: profilesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox.shrink();
                    }

                    if (snapshot.hasError) {
                      return const SizedBox.shrink();
                    }

                    final profiles = snapshot.data ?? [];
                    if (profiles.isEmpty) {
                      return const SizedBox.shrink();
                    }

                    return _buildProfileSection(
                      title: '切换档案',
                      subtitle: '${profiles.length}个可访问档案',
                      icon: Icons.people_rounded,
                      color: Colors.green,
                      onTap: () => _showProfileSwitcher(
                        context,
                        ref,
                        profiles,
                        user.id,
                      ),
                    );
                  },
                );
              },
            ),
            const Divider(height: 32),

            // Profile Sharing Section
            Consumer(
              builder: (context, ref, child) {
                final profilesFuture =
                    ref.watch(userDataProvider.notifier).getProfiles();

                return FutureBuilder(
                  future: profilesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox.shrink();
                    }

                    final profiles = snapshot.data ?? [];
                    return _buildProfileSection(
                      title: '档案共享',
                      subtitle: snapshot.hasError
                          ? '加载失败'
                          : '${profiles.length}个共享档案',
                      icon: Icons.share_rounded,
                      color: Colors.purple,
                      onTap: () => context.push('/profile-sharing'),
                      error: snapshot.hasError,
                    );
                  },
                );
              },
            ),
            const Divider(height: 32),

            // Health Points Section
            Consumer(
              builder: (context, ref, child) {
                final pointsAsync = ref.watch(userPointsProvider);
                return pointsAsync.when(
                  loading: () => _buildProfileSection(
                    title: '健康积分',
                    subtitle: '加载中...',
                    icon: Icons.favorite_rounded,
                    color: Colors.red,
                    onTap: () => context.push('/rewards'),
                  ),
                  error: (error, stack) => _buildProfileSection(
                    title: '健康积分',
                    subtitle: '加载失败',
                    icon: Icons.favorite_rounded,
                    color: Colors.red,
                    onTap: () => context.push('/rewards'),
                    error: true,
                  ),
                  data: (points) => _buildProfileSection(
                    title: '健康积分',
                    subtitle: '${points['currentPoints']}',
                    icon: Icons.favorite_rounded,
                    color: Colors.red,
                    onTap: () => context.push('/rewards'),
                    subtitleStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
            const Divider(height: 32),

            // Quick Info Grid
            Consumer(
              builder: (context, ref, child) {
                final userAsync = ref.watch(userDataProvider);
                return userAsync.when(
                  loading: () => const SizedBox.shrink(),
                  error: (error, stack) => const SizedBox.shrink(),
                  data: (user) {
                    if (user == null) return const SizedBox.shrink();

                    // Here we can add additional user metadata fields when they're available
                    // For now, we'll show a message that this info is not available
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          '用户详细信息即将上线',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection({
    required String title,
    required String subtitle,
    required IconData icon,
    required MaterialColor color,
    required VoidCallback onTap,
    TextStyle? subtitleStyle,
    bool error = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: color.shade400,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: subtitleStyle ??
                      TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: error ? Colors.red : null,
                      ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.grey.shade400,
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSettings(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.settings_rounded,
                  color: Colors.blue.shade400,
                  size: 28,
                ),
                const SizedBox(width: 12),
                const Text(
                  '账户设置',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: () => _showDeleteAccountDialog(context, ref),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
                minimumSize: const Size(double.infinity, 48),
              ),
              icon: const Icon(Icons.delete_forever_rounded),
              label: const Text('删除账户'),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: () async {
                try {
                  await ref.read(appStateProvider.notifier).logout();
                  if (context.mounted) {
                    context.go('/auth');
                  }
                } catch (e) {
                  if (context.mounted) {
                    ErrorHandler.showErrorSnackBar(context, e);
                  }
                }
              },
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 48),
              ),
              icon: const Icon(Icons.logout_rounded),
              label: const Text('退出登录'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除账户'),
        content: const Text('您确定要删除账户吗？此操作无法撤销，所有数据将被永久删除。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              try {
                await ref.read(userDataProvider.notifier).deleteUser();
                if (context.mounted) {
                  context.go('/auth');
                }
              } catch (e) {
                if (context.mounted) {
                  Navigator.pop(context);
                  ErrorHandler.showErrorSnackBar(context, e);
                }
              }
            },
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('确认删除'),
          ),
        ],
      ),
    );
  }

  void _showProfileSwitcher(
    BuildContext context,
    WidgetRef ref,
    List<Query$GetProfiles$getProfiles> profiles,
    String currentUserId,
  ) async {
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Icon(
                  Icons.people_rounded,
                  color: Colors.blue.shade400,
                  size: 24,
                ),
                const SizedBox(width: 12),
                const Text(
                  '切换档案',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const Divider(height: 24),

            // Profiles List
            ...profiles.map((profile) {
              final isCurrentProfile =
                  profile.id == ref.read(appStateProvider).selectedProfile;
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isCurrentProfile
                        ? Colors.blue.shade200
                        : Colors.grey.shade200,
                  ),
                  color: isCurrentProfile
                      ? Colors.blue.shade50
                      : Colors.transparent,
                ),
                child: InkWell(
                  onTap: isCurrentProfile
                      ? null
                      : () {
                          ref
                              .read(appStateProvider.notifier)
                              .changeSelectedProfile(profile.id);
                          setState(() {});
                          Navigator.pop(context);
                        },
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        // Avatar
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isCurrentProfile
                                ? Colors.blue.shade100
                                : Colors.grey.shade100,
                          ),
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.transparent,
                            child: Text(
                              profile.name.characters.first,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: isCurrentProfile
                                    ? Colors.blue.shade700
                                    : Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Profile Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profile.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isCurrentProfile
                                      ? Colors.blue.shade700
                                      : null,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: isCurrentProfile
                                      ? Colors.blue.shade100
                                      : Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.phone_rounded,
                                      size: 14,
                                      color: isCurrentProfile
                                          ? Colors.blue.shade700
                                          : Colors.grey.shade700,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      profile.phoneNumber,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: isCurrentProfile
                                            ? Colors.blue.shade700
                                            : Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Selected Indicator
                        if (isCurrentProfile)
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.shade100,
                            ),
                            child: Icon(
                              Icons.check_rounded,
                              color: Colors.blue.shade700,
                              size: 16,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  void _showEditNameDialog(
      BuildContext context, WidgetRef ref, String currentName) {
    final nameController = TextEditingController(text: currentName);
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('修改姓名'),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: '姓名',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '请输入姓名';
              }
              if (value.length < 2) {
                return '姓名至少需要2个字符';
              }
              if (value.length > 20) {
                return '姓名不能超过20个字符';
              }
              return null;
            },
            autofocus: true,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                try {
                  await ref.read(userDataProvider.notifier).updateUser(
                        name: nameController.text.trim(),
                      );
                  if (context.mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('姓名修改成功'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    Navigator.pop(context);
                    ErrorHandler.showErrorSnackBar(context, e);
                  }
                }
              }
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }
}
