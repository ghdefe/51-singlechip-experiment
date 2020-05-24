#define LEDS 6
#include <reg51.h>
//ledµÆÑ¡Í¨ÐÅºÅ
void delay(void)
{
	unsigned int i;
	for(i=0;i<25000;i++);
}

void main(void)
{
		int i;
		while(i)
		{
				P1 = 0xfe;
				delay();
				for(i=0;i<8;i++)
				{
						P1 = (P1<<1) | 0X01;
						if(P1 == 0XFF) P1 = 0XFE;
						delay();
				}
		}
}