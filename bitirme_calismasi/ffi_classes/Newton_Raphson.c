#include<stdio.h>
#include<conio.h>
#include<math.h>
#include<stdlib.h>
#define f(x) cos(x) - x  // Çözülecek Olan Denklem.
#define g(x) -sin(x) -1  // Çözülecek Olan Denklem'in Türevi.


void main() 
{
	float x0, x1, f0, f1, g0, e;
	int step = 1, N;
	
	// Girişler 
	printf("\n Ilk Tahmini Giriniz: \n ");
	scanf("%f", &x0);
	printf("Kabul Edilebilir Hatayi Giriniz: \n ");
	scanf("%f", &e);
	printf("Maksimum Yinelemeyi Giriniz: \n ");
	scanf("%d", &N);
	
	// Newton - Raphson Methodunu Uygulama
	printf("\nStep\t\tx0\t\tf(x0)\t\tx1\t\tf(x1)\n");
	
	do 
	{
		g0 = g(x0);
		f0 = f(x0);
		
		if(g0 == 0.0)
		{
			printf("Matematiksel Hata.");
			exit(0);
		}
		
		x1 = x0 - f0/g0;
		
		
		printf("%d\t\t%f\t%f\t%f\t%f\n",step,x0,f0,x1,f1);
		x0 = x1;
		
		step = step + 1;
		
		if(step > N)
		{
			printf("Yakinsak Değil");
			exit(0);
		}
		
		f1 = f(x1);
			
	} while(fabs(f1) > e);
	
	printf("\n Bulunan Kok: %f", x1);
	getch();
	
}
