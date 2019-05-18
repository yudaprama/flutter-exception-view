library exception_view;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const sizeBox25 = const SizedBox(height: 25);
const sizeBox15 = const SizedBox(height: 15);
const sizeBox10 = const SizedBox(height: 10);
const sizeBox5 = const SizedBox(height: 5);

class ErrorMessageView extends StatelessWidget {
	final errorObject;
	final VoidCallback onRetry;
	final String unAuthMessage;
	final double height;

	const ErrorMessageView({
		Key key,
		this.errorObject,
		this.onRetry,
		this.unAuthMessage,
		this.height,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		String title = 'Terjadi Kesalahan';
		String message = errorObject.toString();
		String buttonLabel = 'Coba Lagi';
		VoidCallback onPressed = onRetry;
		Widget icon = Container();

		if (height == null)
			return Center(
				child: Padding(
					padding: const EdgeInsets.all(20.0),
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							icon,
							sizeBox15,
							Text(
								title,
								style: Theme.of(context).textTheme.display1,
								textAlign: TextAlign.center,
							),
							const SizedBox(height: 15),
							Text(
								message ?? '',
								textAlign: TextAlign.center,
							),
							const SizedBox(height: 25),
							CupertinoButton(
								color: Colors.orange,
								onPressed: onPressed,
								child: Text(buttonLabel),
							),
						],
					),
				),
			);
		else
			return Padding(
				padding: const EdgeInsets.all(20.0),
				child: Column(
					children: <Widget>[
						SizedBox(height: height,),
						icon,
						sizeBox15,
						Text(
							title,
							style: Theme.of(context).textTheme.display1,
							textAlign: TextAlign.center,
						),
						sizeBox15,
						Text(
							message ?? '',
							textAlign: TextAlign.center,
						),
						sizeBox25,
						CupertinoButton(
							color: Colors.orange,
							onPressed: onPressed,
							child: Text(buttonLabel),
						),
					],
				),
			);
	}
}

Widget dataNotFoundView(BuildContext context, {String message}) {
	return SafeArea(
		child: Center(
			child: Padding(
				padding: const EdgeInsets.symmetric(horizontal: 16.0),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: <Widget>[
						sizeBox10,
						Icon(
							Icons.error,
							color: Colors.deepOrangeAccent,
							size: 48,
						),
						sizeBox10,
						Text(
							'Data Tidak Ditemukan',
							style: Theme.of(context).textTheme.title,
							textAlign: TextAlign.center,
						),
						sizeBox5,
						Text(
							message ?? "Belum ada data",
							textAlign: TextAlign.center,
						),
					],
				),
			),
		),
	);
}