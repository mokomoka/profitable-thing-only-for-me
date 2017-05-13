int r, g, b;//表示してる色
color[] fav = new color[10];//保存したお気に入りの色
color skin = #e1cec1;//肌の色
int n = 0;//お気に入りの何色目か
int count = 0;//既に保存した色と被ってないか確認用
int scene = 1;//色探し場面と結果場面を切り替える
int j=0;//お気に入りの色何周目か

void setup() {
  size(500, 500);
  r=g=b=255;
  frameRate(10);

  for (int i=0; i<10; i++) {
    fav[i]=color(0, 0, 0);
  }
}

void keyPressed() {
  if (key=='f') {//色を保存する
    count=0;
    for (int i=0; i<10; i++) {
      if (fav[i]!=color(r, g, b)) {
        count++;
      }
    }
    if (count==10) {
      fav[n] = color(r, g, b);
      if (n==9) {
        n = 0;
        j++;
      } else {
        n++;
      }
    }
  } else if (key=='j') {//次の色を表示
    r=int(random(0, 255));
    g=int(random(0, 255));
    b=int(random(0, 255));
  } else if (key=='k') {//保存した色をリセット
    for (int i=0; i<10; i++) {
      fav[i]=color(0, 0, 0);
    }
    n = 0;
  } else if (key=='d') {//画面切り替え
    if (scene==1) {
      scene = 2;
    } else if (scene==2) {
      scene = 1;
    }
  } else if (key=='i') {//直前に保存した色を取り消す
    if (n>0) {
      n--;
      fav[n]=color(0);
    }
  }
}

void scene1() {//色選択画面
  background(color(r, g, b));
  fill(skin);
  noStroke();
  rect(175, 175, 150, 150);

  for (int i=0; i<10; i++) {
    fill(fav[i]);
    if (i==n) {
      strokeWeight(3);
      stroke(255, 50, 50);
    } else {
      noStroke();
    }
    if (i<5) {
      rect(25, 37.5+(i*100), 25, 25);
    } else {
      rect(width-50, 37.5+((i-5)*100), 25, 25);
    }
  }

  textSize(20);
  textAlign(CENTER);
  fill(0);
  text("("+r+","+g+","+b+")", width/2, 160);
  fill(255);
  text("("+r+","+g+","+b+")", width/2, 350);
}

void scene2() {//保存色表示画面
  background(255);
  textSize(20);
  textAlign(LEFT,CENTER);
  strokeWeight(1);
  stroke(0);
  if (j==0) {
    for (int i=0; i<n; i++) {
      fill(fav[i]);
      if (i<5) {
        rect(25, 25+(i*100), 50, 50);
        fill(0);
        text("("+int(red(fav[i]))+","+int(green(fav[i]))+","+int(blue(fav[i]))+")", 85, 50+(i*100));
      } else {
        rect(width/2+25, 25+((i-5)*100), 50, 50);
        fill(0);
        text("("+int(red(fav[i]))+","+int(green(fav[i]))+","+int(blue(fav[i]))+")", width/2+85, 50+((i-5)*100));
      }
    }
  } else {
    for (int i=0; i<10; i++) {
      fill(fav[i]);
      if (i<5) {
        rect(25, 25+(i*100), 50, 50);
        fill(0);
        text("("+int(red(fav[i]))+","+int(green(fav[i]))+","+int(blue(fav[i]))+")", 85, 55+(i*100));
      } else {
        rect(width/2+25, 25+((i-5)*100), 50, 50);
        fill(0);
        text("("+int(red(fav[i]))+","+int(green(fav[i]))+","+int(blue(fav[i]))+")", width/2+85, 55+((i-5)*100));
      }
    }
  }
}


void draw() {
  if (scene == 1) {
    scene1();
  } else if (scene == 2) {
    scene2();
  }
}