Learn You a Haskell for Great Good! — 非公式日本語訳
=====================================================

[Miran Lipovača の "Learn You a Haskell for Great Good!"][1] を Kindle 向けに日本語化したコミュニティ訳です。
原著の Kindle 用ソース（[igstan/learn-you-a-haskell-kindle][orig]）を fork し、本文を全章日本語化しました。

> ⚠️ 本訳は CC BY-NC-SA 3.0 に基づく **非公式** のコミュニティ翻訳です。
> オーム社刊『すごいHaskellたのしく学ぼう！』（田中英行・村主崇行 訳, 2012）とは別物で、両者の間に関係はありません。
> 公式の日本語訳が欲しい方はオーム社版を購入してください。

EPUB をビルドする
-----------------
リポジトリには `book.opf` / `toc.ncx` / `pages/` / `css/` / `images/` が揃っているので、
zip にまとめるだけで EPUB ができます：

```sh
./build-epub.sh
# → learn-you-a-haskell-ja.epub
```

生成された `.epub` は最近の Kindle なら Send to Kindle で直接送れますし、
calibre / Kindle Previewer で `.mobi` / `.azw3` への変換もできます。

オリジナル英語版から MOBI を生成する手順
----------------------------------------
1. [KindleGen][2] をダウンロード
2. 実行: `kindlegen -verbose -o learn-you-a-haskell.mobi book.opf`
3. 生成された mobi を Kindle 端末または [Kindle Previewer][2] でテスト

オリジナル
----------
- 原著: [Learn You a Haskell for Great Good!][1] (Miran Lipovača)
- Kindle ソース: [igstan/learn-you-a-haskell-kindle][orig]

ライセンス
----------
原著と同じく Creative Commons 表示-非営利-継承 3.0 非移植ライセンス
（[CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/)）の下で公開されています。

[1]: http://learnyouahaskell.com/
[2]: https://www.amazon.com/gp/feature.html?tag=mr060-20&docId=1000765211
[orig]: https://github.com/igstan/learn-you-a-haskell-kindle
