import java.util.*; //<>// //<>// //<>//
int[] k=new int[700];
int i, min, x, ar, ab, pivot, f;
boolean ter=true;
Stack<Entry> stack = new Stack<Entry>();
void setup() {
  size(700, 700);
  background(255);
  stroke(0);
  for (int i=0; i<700; i++) {//filling the array to be sorted
    k[i]=i;
  }
  for (int i=0; i<700; i++) {
    exch(i, (int)(Math.random() * 699)); //mixing the array
  }
  for (int i=0; i<700; i++) {
    line(i, 700, i, 700-k[i]);
  }
  stack.push(new Entry(0, k.length-1)); //push into the stack the interval of the array
}
/*
because of the way processing works, everything you create in the draw method is only 
actually put into the screen after the end of the call of the method draw(), so the usual recursive implementation of
quicksort would not have worked.
therefore I had to come up, with an iterative implementation of quicksort.
I used this using a stack. So instead of sorting the interval of the array and then recursively calling quicksort with
the next intervals to sort, like in the recursive implementation, I just sort the array and push the next intervals into the stack.
this way, the method draw can finish its call, the put the image in the screen and then pop the next interval, making the
visualization and iterative implementation possible
*/
void draw() {
 if (ar<=ab&&!ter) {
        ter=true;
        cambiar(ab, f);
        stack.push(new Entry(ab+1, f));
        stack.push(new Entry(i, ab-1));
      }
  else if(!stack.isEmpty()||!ter) {
    if(ter){
      Entry j=stack.pop();
      i=j.inico;
      f=j.fina;
      pivot=k[(f+i)/2];
      cambiar((f+i)/2, f);
    }
    if (!ter) {
      while (k[ar]>=pivot&&ar>i) {
        ar--;
      }
      while (k[ab]<=pivot&&ab<f) {
        ab++;
      }
      if (ar>ab)
        cambiar(ar, ab);
    } else {
      if ((f-i)>=2) {
        if(ter){
        ar=f;
        ab=i;
        }
        ter=false;
        while (k[ar]>=pivot&&ar>i) {
          ar--;
        }
        while (k[ab]<=pivot&&ab<f) {
          ab++;
        }
        if (ar>ab){
          cambiar(ar, ab);
        }
      } else {
        if (i<f&&k[i]>k[f])
          cambiar(i, f);
          ter=true;
      }
    }
  } //<>//
}

public void resaltar(int index) {
  stroke(255);
  line(index, 700, index, 0);
  line(index, 700, index, 700-k[index]);
}
public void rellenar(int index) {
  stroke(0);
  line(index, 700, index, 700-k[index]);
}
public void dibujar(int index) {
  stroke(255);
  line(index, 700, index, 0);
  stroke(0);
  line(index, 700, index, 700-k[index]);
}
public void cambiar(int indexa, int indexb) {
  exch(indexa, indexb);
  dibujar(indexa);
  dibujar(indexb);
}
public void exch(int indexa, int indexb) {
  int a=k[indexa];
  k[indexa]=k[indexb];
  k[indexb]=a;
}
public void prueba() {
  resaltar(i);
  for (int o=i; o<700; o++) {
    if (k[o]<k[min]) {
      min=o;
    }
  }
  cambiar(i, min);
  i++;
  min=i;
}
public void prueba2(){
   if (ar<=ab&&!ter) {
        ter=true;
        cambiar(ab, f);
        stack.push(new Entry(ab+1, f));
        stack.push(new Entry(i, ab-1));
      }
  else if(!stack.isEmpty()||!ter) {
    if(ter){
      Entry j=stack.pop();
      i=j.inico;
      f=j.fina;
      pivot=k[(f+i)/2];
      exch((f+i)/2, f);
    }
    if (!ter) {
      while (k[ar]>=pivot&&ar>i) {
        ar--;
      }
      while (k[ab]<=pivot&&ab<f) {
        ab++;
      }
      if (ar>ab)
        cambiar(ar, ab);
    } else {
      if ((f-i)>=2) {
        if(ter){
        ar=f;
        ab=i;
        }
        ter=false;
        while (k[ar]>=pivot&&ar>i) {
          ar--;
        }
        while (k[ab]<=pivot&&ab<f) {
          ab++;
        }
        if (ar>ab){
          cambiar(ar, ab);
        }
      } else {
        if (i<f&&k[i]>k[f])
          cambiar(i, f);
          ter=true;
      }
    }
  }
}
public static class Entry {
  public int inico;
  public int fina;
  public Entry(int a, int b) {
    inico=a;
    fina=b;
  }
}
