package elements
{
	import flash.display.Sprite;
	import flash.display.BlendMode;
	import com.greensock.TweenLite;
	import com.greensock.easing.Sine;

	public class Element extends Sprite
	{
		public var pos: Array = null;
		
		public function Element()
		{
			this.blendMode = BlendMode.LAYER;
			this.mouseChildren = false;
			deactive();
			setPos( 0 );
		}
		
		public function setPos( n: int, s: Number = 0, d: Number = 0 ): void
		{
			TweenLite.killTweensOf( this );
			if( !pos ) return;
			var p: Object = n >= pos.length ? pos[ 0 ] : pos[ n ];
			TweenLite.to( this, s, { x: p.x, y: p.y, alpha: p.alpha, ease: Sine.easeOut, delay: d	} );
		}
		
		public function resetPos(): void
		{
			setPos( 0 );
		}
		
		public function killTween(): void
		{
			TweenLite.killTweensOf( this );
		}
		
		public function active(): void
		{
			this.mouseEnabled = true;
			this.buttonMode = true;
		}
		
		public function deactive(): void
		{
			this.mouseEnabled = false;
			this.buttonMode = false;
		}
	}
}