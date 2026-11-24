// Bump V on every release. Pages/config are network-first so updates always arrive; assets are cache-first for offline.
const V='line-v11',A=['./','index.html','config.js','manifest.webmanifest','icon-192.png','icon-512.png'];
self.addEventListener('install',e=>e.waitUntil(caches.open(V).then(c=>Promise.all(A.map(u=>fetch(new Request(u,{cache:'reload'})).then(r=>{if(!r.ok)throw 0;return c.put(u,r)})))).then(()=>self.skipWaiting())));
self.addEventListener('activate',e=>e.waitUntil(caches.keys().then(k=>Promise.all(k.filter(x=>x!==V).map(x=>caches.delete(x)))).then(()=>clients.claim())));
const put=(r,res)=>{if(res.ok){const cp=res.clone();caches.open(V).then(c=>c.put(r,cp))}return res};
self.addEventListener('fetch',e=>{const r=e.request;if(r.method!=='GET'||new URL(r.url).origin!==location.origin)return;
 if(r.mode==='navigate'||/(index\.html|config\.js)$/.test(r.url)){
  e.respondWith(fetch(r.url,{cache:'no-cache'}).then(res=>put(r,res)).catch(()=>caches.match(r,{ignoreSearch:true}).then(x=>x||caches.match('index.html'))));return}
 e.respondWith(caches.match(r,{ignoreSearch:true}).then(x=>x||fetch(r).then(res=>put(r,res)).catch(()=>caches.match('index.html'))))});
