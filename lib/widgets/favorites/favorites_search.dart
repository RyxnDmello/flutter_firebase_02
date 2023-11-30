import 'package:flutter/material.dart';

import './search/favorites_search_input.dart';
import './search/favorites_search_button.dart';

class FavoritesSearch extends StatelessWidget {
  const FavoritesSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String? location;

    void submitForm() {
      formKey.currentState!.save();

      if (location!.length < 4) return;
    }

    void saveLocation(String? loc) {
      location = loc;
    }

    return Form(
      key: formKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FavoritesSearchInput(
              saveInput: saveLocation,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          FavoritesSearchButton(
            onSubmit: submitForm,
          ),
        ],
      ),
    );
  }
}
