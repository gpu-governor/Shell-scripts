# typing2.ps1
# -------------------------------------
# Ensure the console uses UTF-8 encoding (helps with special characters)
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# A list of ASCII-friendly sentences
$sentences = @(
    "que hora son o que hora se",
    "life is what happens when you're busy making other plans.",
    "to be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.",
    "it always seems impossible until it's done.",
    "the only way to do great work is to love what you do.",
    "you miss 100% of the shots you don't take.",
    "success is not final, failure is not fatal: it is the courage to continue that counts.",
    "believe you can and you're halfway there.",
    "don't watch the clock; do what it does. keep going.",
    "if you want to go fast, go alone. if you want to go far, go together.",
    "the only limit to our realization of tomorrow is our doubts of today.",
    "our greatest glory is not in never falling, but in rising every time we fall.",
    "the way to get started is to quit talking and begin doing.",
    "life is 10% what happens to us and 90% how we react to it.",
    "you can't go back and change the beginning, but you can start where you are and change the ending.",
    "the best way to predict the future is to create it.",
    "don't be pushed around by the fears in your mind. be led by the dreams in your heart.",
    "keep your face always toward the sunshine--and shadows will fall behind you.",
    "in the middle of every difficulty lies opportunity.",
    "you are never too old to set another goal or to dream a new dream.",
    "happiness depends upon ourselves.",
    "the only impossible journey is the one you never begin.",
    "life isn't about waiting for the storm to pass, it's about learning to dance in the rain.",
    "don't limit your challenges, challenge your limits.",
    "the future belongs to those who believe in the beauty of their dreams.",
    "start where you are. use what you have. do what you can.",
    "you can never cross the ocean until you have the courage to lose sight of the shore.",
    "success is not how high you have climbed, but how you make a positive difference to the world.",
    "in the end, we will remember not the words of our enemies, but the silence of our friends.",
    "it does not matter how slowly you go as long as you do not stop.",
    "act as if what you do makes a difference. it does.",
    "success is not measured by what you accomplish, but by the obstacles you overcome and the persistence you show in the face of adversity, proving that resilience is the key to growth.",
    "life is not about waiting for opportunities to come to you, but about creating your own chances by stepping out of your comfort zone, pushing your limits, and embracing new challenges with an open heart and mind.",
    "the greatest challenge in life is not overcoming others, but overcoming your own self-doubt and fear, for it is only by believing in your own potential that you can truly achieve greatness.",
    "dreams are not meant to be chased alone; they are meant to be shared with those who inspire you, those who believe in you, and those who encourage you to never give up on what you truly desire.",
    "failure is not the end of the road, but merely a detour that teaches you valuable lessons, helping you to refine your strategy and emerge stronger and wiser than before.",
    "sometimes the greatest growth happens when you step into the unknown, embrace uncertainty, and trust that every experience, whether good or bad, is shaping you into the person you're meant to become.",
    "don't wait for the perfect moment to begin; start where you are, with what you have, and trust that every small step will lead you closer to your ultimate goal, even if it seems impossible at first.",
    "true success comes not from the recognition of others, but from the satisfaction of knowing that you gave your best, learned from your mistakes, and never gave up on your dreams.",
    "it is not the years in your life that count, but the life in your years; embrace every moment, seize every opportunity, and make the most of every day you are given, for time is a gift that should never be wasted.",
    "the path to success is rarely a straight line; it is filled with twists, turns, and obstacles, but it is the determination to keep going, despite the setbacks, that leads to ultimate victory.",
    "don't let fear of failure keep you from trying, for it is through our failures that we learn the most valuable lessons and build the resilience necessary to achieve success in the future.",
    "you don't need to be perfect to be great, you just need to be willing to try, to learn from your mistakes, and to keep improving every day, no matter how small the progress may seem.",
    "the greatest thing you can do is not just to dream big, but to take concrete steps toward making those dreams a reality, no matter how challenging the journey may be.",
    "no matter how many times you fall, what matters is how many times you get back up, dust yourself off, and keep moving forward, for it is your resilience and perseverance that define your true strength.",
    "success is not found in the destination, but in the journey; it is the lessons you learn, the challenges you overcome, and the person you become along the way that make all the difference.",
    "your potential is limitless, but only if you are willing to push yourself beyond the boundaries of your comfort zone, take risks, and trust that you are capable of achieving more than you ever imagined.",
    "in a world full of distractions, the true key to success lies in your ability to stay focused on what truly matters, to remain disciplined, and to keep your eyes on the prize no matter the obstacles in your path.",
    "success comes to those who never give up, who continue to push forward even when the road ahead seems uncertain, and who trust that their hard work and dedication will eventually pay off.",
    "the most important investment you can make is in yourself--your skills, your growth, your mindset--and once you realize your own worth, there is no limit to what you can achieve.",
    "it is not the size of the dream that matters, but the size of the determination to make that dream come true, for determination and perseverance are the true fuels for success."
)

# Select a random sentence
$sentence = $sentences | Get-Random
$sentenceArray = $sentence.ToCharArray()

# Show instructions
Write-Host "`nType the following sentence (press Enter when done):" -ForegroundColor Cyan
Write-Host "`n$sentence" -ForegroundColor Yellow
Write-Host ""

# Initialize counters & time
$userInput   = ""
$correctCount = 0
$wrongCount   = 0
$startTime = Get-Date

# Loop through each character in the sentence
for ($i = 0; $i -lt $sentenceArray.Length; $i++) {

    # Read single key from user (no echo)
    $key = [System.Console]::ReadKey($true)

    # Break on Enter key
    if ($key.Key -eq 'Enter') { break }

    # Append typed character
    $typedChar = $key.KeyChar
    $userInput += $typedChar

    # Compare typed char with correct char
    if ($typedChar -eq $sentenceArray[$i]) {
        # Correct => green
        Write-Host -NoNewline $typedChar -ForegroundColor Green
        $correctCount++
    }
    else {
        # Incorrect => red
        Write-Host -NoNewline $typedChar -ForegroundColor Red
        $wrongCount++
    }
}

# End time for stats
$endTime = Get-Date
$timeTaken = ($endTime - $startTime).TotalSeconds

# Move to a new line
Write-Host "`n"

# Compare final typed string
if ($userInput -eq $sentence) {
    Write-Host "Great job! You typed it perfectly!" -ForegroundColor Green
} else {
    Write-Host "You made some mistakes. Try again!" -ForegroundColor Red
}

# Calculate stats
$typedChars = $correctCount + $wrongCount
if ($typedChars -eq 0) {
    $accuracy = 0
    $wpm = 0
} else {
    # Accuracy = (correct / total typed) * 100
    $accuracy = [math]::Round(($correctCount / $typedChars) * 100, 2)

    # Words per minute = (total chars / 5) / (time in minutes)
    $timeInMinutes = $timeTaken / 60
    $wpm = 0
    if ($timeInMinutes -gt 0) {
        $wpm = [math]::Round((($typedChars / 5) / $timeInMinutes), 2)
    }
}

Write-Host "Time taken:     $([math]::Round($timeTaken,2)) seconds" -ForegroundColor Cyan
Write-Host "Correct chars:  $correctCount" -ForegroundColor Green
Write-Host "Wrong chars:    $wrongCount"  -ForegroundColor Red
Write-Host "Accuracy:       $accuracy%"    -ForegroundColor Yellow
Write-Host "Typing speed:   $wpm WPM"      -ForegroundColor Magenta
