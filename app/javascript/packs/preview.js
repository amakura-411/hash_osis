document.addEventListener('DOMContentLoaded', () => {
    const createImageHTML = (blob) => {
        //newimageを持つ要素を探す
        const imageElement = document.getElementById('new-image');
        //imgのhtml要素を作り、blobImageに格納
        const blobImage = document.createElement('img');
        //blobimageにnew-imageクラスとblobのsrcを付与
        //srcはファイルの場所を記述するように用いられるタグの一つ。イメージは住所。
        blobImage.setAttribute('class', 'new-img')
        blobImage.setAttribute('src', blob);

        //実際にデータを表示
        //<div id='new-image'></div>にblobImageを追加
        imageElement.appendChild(blobImage);
    };
    //ファイルのidを探して、ファイルがアップされたら実行
    document.getElementById('character_image').addEventListener('change', (e) =>{
        //既存のimgがある場合、そのデータを消す。
        const imageContent = document.querySelector('img'); 
        if (imageContent){
            imageContent.remove();
        }
        //アップされたファイルを読み取り文字列としてfile→blobに格納
        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);
        createImageHTML(blob);
    });
});