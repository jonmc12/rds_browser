$.fn.serializeObject=function(){var a={},b=this.serializeArray();return $.each(b,function(){a[this.name]!==undefined?(a[this.name].push||(a[this.name]=[a[this.name]]),a[this.name].push(this.value||"")):a[this.name]=this.value||""}),a}