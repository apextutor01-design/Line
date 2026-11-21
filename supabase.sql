-- Run once in Supabase: SQL Editor -> New query -> paste -> Run
create table if not exists public.scores (
  player_id uuid primary key,
  name text not null check (char_length(name) between 2 and 12),
  score int not null check (score between 0 and 200000),
  dist int not null, pts int not null,
  updated_at timestamptz default now()
);
alter table public.scores enable row level security;
drop policy if exists "read all" on public.scores;
create policy "read all" on public.scores for select to anon using (true);
revoke insert, update, delete on public.scores from anon;

create or replace function public.submit_score(p_id uuid,p_name text,p_score int,p_dist int,p_pts int,p_time int)
returns void language plpgsql security definer set search_path=public as $$
begin
  if p_time<1 or p_dist<0 or p_pts<0 or p_score<>p_dist+p_pts*10
     or p_dist>p_time*55+100 or p_pts>p_time/0.3+5
     or char_length(trim(p_name)) not between 2 and 12 then
    raise exception 'invalid';
  end if;
  insert into public.scores(player_id,name,score,dist,pts) values(p_id,trim(p_name),p_score,p_dist,p_pts)
  on conflict (player_id) do update set
    name=excluded.name,
    dist=case when excluded.score>public.scores.score then excluded.dist else public.scores.dist end,
    pts=case when excluded.score>public.scores.score then excluded.pts else public.scores.pts end,
    score=greatest(public.scores.score,excluded.score),
    updated_at=now();
end $$;
grant execute on function public.submit_score to anon;
