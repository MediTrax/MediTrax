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
                      Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
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
            _buildProfileSection(
              title: '健康积分',
              subtitle: '1,250',
              icon: Icons.favorite_rounded,
              color: Colors.red,
              onTap: () => context.push('/rewards'),
              subtitleStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(height: 32),

            // Quick Info Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 2.5,
              children: [
                _buildInfoCard('年龄', '35岁', Icons.cake_rounded, Colors.orange),
                _buildInfoCard(
                    '血型', 'A型', Icons.water_drop_rounded, Colors.red),
                _buildInfoCard(
                    '身高', '175cm', Icons.height_rounded, Colors.blue),
                _buildInfoCard(
                    '体重', '70kg', Icons.monitor_weight_rounded, Colors.green),
              ],
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

  Widget _buildInfoCard(
    String label,
    String value,
    IconData icon,
    MaterialColor color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.shade100),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: color.shade400,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 11,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 1),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: color.shade700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
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
}
