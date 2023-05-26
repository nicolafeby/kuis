import 'package:flutter/material.dart';
import 'package:kuis/core/widget/custom_appbar.dart';
import 'package:kuis/presentation/topic/widget/topic_button_tile.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      elevation: 0,
      title: Text(
        'Topics',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }

  Widget _buildBody() {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: 20,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 12.0);
      },
      itemBuilder: (BuildContext context, int index) {
        return const TopicButtonTile(title: 'Politic');
      },
    );
  }
}
