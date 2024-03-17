import '../library.dart';

Widget myTextFiled(
        {void Function(String)? onChanged,
        void Function(String?)? onSaved, //
        @required String? labelText, //
        String? validatorText,
        @required TextInputType? keyboardType,
        String? Function(String?)? validator,
        void Function()? onTap,
        Widget? suffixIcon,
        bool obscureText = false,
        bool isvalidator = true,
        String? hintText,
        String? initialValue,
        TextEditingController? controller,
        bool readOnly = false,
        double? height = 77,
        int maxLines = 1,
        Color? fillColor = const Color.fromRGBO(238, 238, 238, 1),
        List<TextInputFormatter>? inputFormatters}) =>
    SizedBox(
      height: height,
      child: TextFormField(
        onFieldSubmitted: onSaved,
        inputFormatters: inputFormatters,
        initialValue: initialValue,
        maxLines: maxLines,
        textAlign: TextAlign.start,
        onTap: onTap,
        autofocus: false,
        readOnly: readOnly,
        controller: controller,
        validator: isvalidator ? (value) => value!.isEmpty ? validatorText : null : validator,
        keyboardType: keyboardType,
        onChanged: onChanged,
        obscureText: obscureText,
        cursorColor: AppBrand.mainColor,
        decoration: InputDecoration(
            // helperText: "",
            filled: true,
            fillColor: fillColor,
            //AppBrand.backgroundCategroy,
            suffixIcon: suffixIcon,
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)), gapPadding: 0, borderSide: BorderSide(width: .4, color: Colors.red)),
            focusedBorder:
                const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5.0)), borderSide: BorderSide(width: 1.2, color: AppBrand.mainColor)),
            disabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey)),
            border:
                const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5.0)), borderSide: BorderSide(width: .4, color: AppBrand.mainColor)),
            labelText: labelText,
            hintText: hintText,
            errorStyle: const TextStyle(fontSize: 14),
            labelStyle: const TextStyle(color: AppBrand.mainColor)),
      ),
    );
