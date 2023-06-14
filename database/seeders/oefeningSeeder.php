<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class oefeningSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('oefeningen')->insert([
            'name' => 'Squat',
            'name_nl' => 'Squat',
            'description' => 'The squat is an exercise to train your Hamstrings and hips.',
            'description_nl' => 'Squat is een kniebuiging. Je oefent hiermee je hamstrings, heupen, quadriceps en bilspieren. ',
            'explanation' => '1.	Stand up straight.
            2.	Keep your arms at the level of your shoulders.
            3.	Lower your legs slowly.
            4.	Make sure your knees are at a 90-degree angle.
            5.	Go back up slowly.
            Repeat this exercise 10 more times, good luck. ',
            'explanation_nl' => '
            1.	Sta rechtop.
            2.	Houd je armen op de hoogte van je schouders.
            3.	Zak je benen langzaam.
            4.	Zorg dat je knieën een hoek hebben van 90 graden.
            5.	Ga weer langzaam omhoog.
            herhaal 10 keer veel succes!',
            'GIF' => 'Squat.gif'
        ]);
        DB::table('oefeningen')->insert([
            'name' => 'Push-up',
            'name_nl' => 'Push-up',
            'description' => 'Push-ups is an exercise to train your arms.',
            'description_nl' => 'Push-Up is een oefening waar je jezelf laat stijgen en zakken via je armen.',
            'explanation' => '1.	Lie down on the floor.
            2.	Make sure your hands are on the floor and your toes.
            3.	Lower down slowly and touch the floor with your chest.
            4.	Go back up.
            Repeat this exercise 5 more times, good luck.',
            'explanation_nl' => '
            1.	Ga liggen op de grond
            2.	Zorg ervoor dat je handen op de grond zitten en je tenen
            3.	Zak langzaam omlaag en raak met je borst de grond aan
            4.	Ga weer omhoog
            Herhaal dit 5 keer en veel succes met de oefening.',
            'GIF' => 'Push-up.gif'
        ]);
        DB::table('oefeningen')->insert([
            'name' => 'Dip',
            'name_nl' => 'Dip',
            'description' => 'With the Dip, you try to raise yourself on the Dip bar with your arms so you can train your arm muscles.',
            'description_nl' => 'Dip is een oefening waar je jezelf omhoog hijst en jezelf weer laat zakken op een “Dip bar”',
            'explanation' => '1.	Grab the parallel “Dip bars”, jump up and straighten your arms.
            2.	Bend and cross your legs so that they are stable and to lower yourself deeply.
            3.	Lean forward slightly, but make sure to keep your body straight. Lower your body by bending your arms.
            4.	Zip down slowly and steadily, make sure that you keep your elbow at shoulder level.
            5.	Lift your body back up at a rapid pace by extending your arms fully. Then exhale.
            6.	Brace your elbows for a moment.
            7.	Repeat from step 2.
            Do this exercise 5 more times. If you think its easy do it 10 more time, good luck.',
            'explanation_nl' => '1.	Grijp de parallelle “Dip bars”, spring omhoog en strek je armen.
            2.	Buig en kruis je benen zodat ze stabiel staan en om diep te zakken.
            3.	Leun een klein beetje naar voren, maar zorg dat je je lichaam recht houd. Laat je lichaam zakken door je armen te buigen.
            4.	Zip langzaam en rustig naar beneden, zorg dat je schouders op dezelfde hoogte zitten als je ellebogen.
            5.	Til je lichaam weer op met een snelle vaart door je armen volledig te strekken. Adem daarna uit.
            6.	Zet je ellebogen even vast.
            7.	Herhaal vanaf stap 2.
	        Doe dit 5 keer en veel succes met de oefening.',
            'GIF' => 'dip.gif'
        ]);
        DB::table('oefeningen')->insert([
            'name' => 'Plank',
            'name_nl' => 'Plank',
            'description' => 'Planking is an exercise to get a stable hip. Lay down and use your arms to try to stay as steady and straight as possible.',
            'description_nl' => 'Planken of Planking is een oefeningen om je rompstabiliteit te oefenen. Je gebruikt hier je armen om je lichaam gestrekt te houden boven de grond.',
            'explanation' => 'Lie down on the floor.
            1.	Keep your elbows at a 90-degree angle below your shoulders.
            2.	Support your body with your elbows and your toes, and make sure your back is straight.
            3.	Try to stay straight as much as possible.
            4.	Hold this position for 30 seconds.
            Good luck with the exercise.',
            'explanation_nl' => '1.	Ga liggen op de grond
            2.	Houd je ellebogen op een hoek van 90 graden onder je schouders
            3.	Steun op je ellebogen en je tenen en zorg ervoor dat je rug recht is
            4.	Probeer zo veel mogelijk recht te blijven
            5.	Houdt deze positie vast voor 30 seconden',
            'GIF' => 'plank.gif'
        ]);
        DB::table('oefeningen')->insert([
            'name' => 'Donkey Kicks',
            'name_nl' => 'Paardentrap',
            'description' => 'The Donkey kick is an exercise to train your hamstrings. If you do the exercise you can feel it in your hamstrings, if you do not feel it there you are doing it wrong.',
            'description_nl' => 'De Paardentrap is een oefening om je bil en hamstring mee te trainen. Als je de oefening uitvoert dan voel je het in je bil en train je de hamstring hiermee.',
            'explanation' => '1.	Lie with your elbows and knees on the floor with your face toward the floor.
            2.	Stretch your right leg back. Do not overdo this.
            3.	Keep your leg straight for a few seconds, then return to the original position.
            4.	Now repeat this exercise with your other leg.
            Do this 10 more times. Good luck with the exercise.',
            'explanation_nl' => '1.	Ga met je ellebogen en knieën op de grond liggen met je gezicht naar de grond toe.
            2.	Strek je rechterbeen naar achteren. Doe dit niet te overdreven.
            3.	Houd je been voor een paar seconden gestrekt en ga dan terug naar de originele positie.
            4.	Herhaal deze oefening nu met je andere been.
            Doe deze oefening 5 keer en veel succes.',
            'GIF' => 'Paardentrap.gif'
        ]);
        DB::table('oefeningen')->insert([
            'name' => 'Mountain climber',
            'name_nl' => 'Mountain climber',
            'description' => 'The Mountain climber is an exercise. Where you are doing as if you are walking up a mountain. It trains your stamina and balance.',
            'description_nl' => 'Mountain Climber is een oefening waar je doet alsof je een berg oprent. Je gebruikt je core, schouders en triceps. Je oefent hiermee je uithoudingsvermogen en balans.',
            'explanation' => '1.  Lie down and put your hands on the floor and lean on your toes.
            2.	Tighten your abs and glutes.
            3.	Always bring 1 leg towards your arm.
            4.	Repeat this exercise 10 times.',
            'explanation_nl' => '1.	Ga liggen en zet je handen op de grond en steun op je tenen.
            2.	Span je buik en bilspieren aan.
            3.	Breng steeds 1 been richting je arm toe.
            Herhaal de oefening 10 keer en veel succes.',
            'GIF' => 'Mountain-climber.gif'
        ]);
        DB::table('oefeningen')->insert([
            'name' => 'Burpees',
            'name_nl' => 'Burpees',
            'description' => 'The Burpee is an exercise that looks like a push-up. After doing the push-up, you jump with your hands in the air. You can train your whole body muscles with this exercise.',
            'description_nl' => 'Burpee lijkt een hoop op een push-up, het verschil is dat je na een push-up rechtop gaat staan en een sprong maakt. Je oefent de volgende spieren hiermee: Borst, Bovenbenen, Schouders, Triceps, Rug, Buik, Billen en Hamstrings.',
            'explanation' => '1.	Lie down in a push-up position. Make sure you do this with a straight back.
            2.	Jump your feet toward your hands and push yourself up with your legs.
            3.	Keep your arms straight during the jump
            4.	Place your hands on the floor first on the landing and then return to your push-up position.
            5.	Now repeat the exercise.
            Do this 2 × 10 times. Good luck.',
            'explanation_nl' => '1.	Ga liggen in een push-up houding. Zorg dat je dit doet met een rechte rug.
            2.	Spring met je voeten richting je handen en duw jezelf met je benen omhoog.
            3.	Houd je armen gestrekt tijdens de sprong
            4.	Plaats je handen als eerste op de grond tijdens de landing en ga vervolgens weer naar je push-up positie.
            5.	Herhaal nu de oefening.
            Doe dit 5 keer en veel succes met de oefening',
            'GIF' => 'Burpees.gif'
        ]);
        DB::table('oefeningen')->insert([
            'name' => 'Lunge',
            'name_nl' => 'Lunge',
            'description' => 'The lunge is an exercise that trains your butt muscles and hamstrings.',
            'description_nl' => 'Lunge is een oefening waar je één been van het lichaam naar voren zet met een gebogen knie op de grond. Je plaats het andere been hierachter. Je doet hiermee de bilspieren, billen, hamstrings, quadriceps en je dijen trainen. ',
            'explanation' => '1.	Stand up straight and put both hands on your hips.
            2.	Take a big step forward with 1 foot, making sure that the knee is at a 90-degree angle.
            3.	The other knee should also be at a 90-degree angle and just barely touch the ground.
            4.	Stay in this position for 5 seconds and then return to the starting position.
            5.	Now do this with your other leg.
            Repeat this 10 times. Good luck with the training.',
            'explanation_nl' => '1.	Sta rechtop en zet beide handen op je heupen
            2.	Doe met 1 voet een grote stap naar voor zorg ervoor dat die knie een hoek van 90 graden heeft
            3.	De andere knie moet ook een hoek van 90 graden hebben en moet net de grond niet kunnen aanraken
            4.	Blijf 5 seconden in deze positie en ga dan weer terug in de startpositie
            5.	Doe dit nu met je andere been
            Herhaal dit 10 keer en veel succes met de oefeningen',
            'GIF' => 'Lunge.gif'
        ]);
        DB::table('oefeningen')->insert([
            'name' => 'Wall sit',
            'name_nl' => 'Wall sit',
            'description' => 'With the wall sit, you train your belly and back muscles. Your knees should be 90 degrees and your back should be against the wall.',
            'description_nl' => 'De Wall sit is een oefening waar je je buik en rugspieren traint. Je gaat tegen een platte muur staan met gebogen knieën en je blijft in deze houding staan totdat de tijd voorbij is.',
            'explanation' => '1.	Find a wall and stand with your back against it.
            2.	Push your back against the wall and slowly lower yourself down into the squat position.
            3.	Keep tension in your thighs, abs and make sure to keep your back straight.
            4.	Hold this position until the time is up.
            Do this exercise for 35 seconds. Good luck.',
            'explanation_nl' => '1.	Zoek een muur en ga daar met je rug tegenaan staan.
            2.	Duw je rug tegen de muur en laat jezelf langzaam naar beneden zakken en ga in de squat positie staan.
            3.	Houd spanning in je bovenbenen, buikspieren en zorg dat je je rug recht houd.
            4.	Behoud deze positie totdat de tijd op is.
            Doe de oefening voor 30 seconden en veel succes',
            'GIF' => 'Wall-sit.gif'
        ]);
        DB::table('oefeningen')->insert([
            'name' => 'Crunch',
            'name_nl' => 'Crunch',
            'description' => 'A crunch is an alternative to a sit-up. Because with the Crunch, you train your straight belly muscles. This is a very good exercise to train your belly with',
            'description_nl' => 'Een crunch is een alternatief van een sit-up. Met de crunch train je de rechte buikspieren. Je drukt je buik samen vanuit een liggende positie en je trekt je romp met je buikspieren naar je benen toe. Dit is een goede oefening voor de buikspieren.',
            'explanation' => '1.	Lie on your stomach and make sure your knees are at a 90-degree angle.
            2.	Put your hands on your chest.
            3.	In that position, slowly lift your shoulders towards your knees.
            4.	Now lower back, but do not touch the floor, repeat this exercise 10 times.
            Do this 20 times if you finished it easy.',
            'explanation_nl' => '1.	Ga op je buik liggen en maak zorg ervoor dat je knieën een hoek hebben van 90 graden.
            2.	Zet je handen op je borst.
            3.	Til in die positie langzaam je schouders op richting je knieën.
            4.	Zak nu terug, maar raak de grond niet aan.
            Doe deze oefening 10 keer en veel succes.',
            'GIF' => 'Crunch.gif'
        ]);
    }
}
